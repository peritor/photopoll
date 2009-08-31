//Copyright (c) 2008 Lewis Linn White Jr.
//Author: Lewis Linn White Jr.

//Permission is hereby granted, free of charge, to any person
//obtaining a copy of this software and associated documentation
//files (the "Software"), to deal in the Software without
//restriction, including without limitation the rights to use,
//copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the
//Software is furnished to do so, subject to the following
//conditions:

//The above copyright notice and this permission notice shall be
//included in all copies or substantial portions of the Software.
//Except as contained in this notice, the name(s) of the above 
//copyright holders shall not be used in advertising or otherwise 
//to promote the sale, use or other dealings in this Software without 
//prior written authorization.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//OTHER DEALINGS IN THE SOFTWARE.

//Icons used in this project are graciously provided by the Silk icons set:
//http://www.famfamfam.com/lab/icons/silk/

function jVote(parent, settings)
{
	this.locked = false;
	this.images = [];
	this.settings = settings;
	this.parent = parent;
	this.init();
}

jVote.prototype.init = function()
{
	var that = this;
	for(var i = 0, e = this.settings.max; i < e; i++)
	{
		var image = document.createElement('img');
		this.images[i] = image;
		image.value = this.settings.labels[i];
		image.alt = this.settings.labels[i];
		image.style.cursor = 'pointer';
		image.onmouseover = function()
		{
			if(that.locked)
			{
				return;
			}
			that.set(this);
		};
		image.onclick = function(evnt)
		{
			if(that.locked)
			{
				return;
			}
			var eEvent = evnt || window.event;
			if(that.settings.click)
			{
				that.settings.click(eEvent, this.value);
			}
		};
		document.getElementById(this.parent).appendChild(image);
	}
	this.set(this.images[this.settings.min-1]);
};

jVote.prototype.set = function(domImage)
{
	domImage.src = '/javascripts/jvote/star.png';
	var next = domImage.nextSibling;
	while(next)
	{
		next.off = true;
		next.src = '/javascripts/jvote/dark_star.png';
		next = next.nextSibling;
	}
	var prev = domImage.previousSibling;
	while(prev)
	{
		prev.off = false;
		prev.src = '/javascripts/jvote/star.png';
		prev = prev.previousSibling;
	}
};

jVote.prototype.reset = function(num)
{
	if(this.locked)
	{
		return;
	}
	var index = (num) ? num : this.settings.min;
	this.set(this.images[index-1]);
};

jVote.prototype.lock = function()
{
	this.locked = true;
};

jVote.prototype.unLock = function()
{
	this.locked = false;
};