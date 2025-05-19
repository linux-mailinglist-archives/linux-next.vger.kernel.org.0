Return-Path: <linux-next+bounces-6840-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC35ABC7E0
	for <lists+linux-next@lfdr.de>; Mon, 19 May 2025 21:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5303A8546
	for <lists+linux-next@lfdr.de>; Mon, 19 May 2025 19:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CEA1F462F;
	Mon, 19 May 2025 19:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VE6nigwP"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46191EB18A;
	Mon, 19 May 2025 19:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683201; cv=none; b=MdaOBp5G5+KNlsMdmvTxDGBHXRzal387swydg2Yxv8Hwrk+/Lr6mYGl6m9IRmTlbr/qZvN7GXt0dei4GhXZmbh/IeUCETn1GVWSRHXAycgJ9ykNYDOiEeT1+A9Q4qsqAS6l8dNpWNR+aLwvTHiBP0Pg8aKALiSCSxEz+eiaFBYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683201; c=relaxed/simple;
	bh=A0wQ3tP7Kt9+GSjmXRRUkxNxuXQE6aet64FxQJPc7Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PgFrTyj4f+vPAlAZYDERihwmIEMfjUsFwLWnbxPVWl8dyc7tCmCrzJrn0B+bcZNZRd5aGVBtYbW10HL8zrH0HQC1h8pymcweaVq0w0XyjV48de2MdLuEeNg9F8TdJs07y1emYI1HaIastTLUSRWA/U552gc7S309IRp5GrNs9NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VE6nigwP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=InuXJoEHlMlH9HLxvIAMD1VL/vcfOh5/RbshItV4lp0=; b=VE6nigwP79v15FaeosO9qW8Wb7
	U5KNQIzCRFkK/uk/hrv/hYcX1/dgBy9PwBVkQS874Ez/LkpNdbYaiMRDsH11A+DcBc3fSWPSnSoyQ
	FDe6GEDB3Q5bxiXEsNsWCIbDzeP6qbfBRw2g4mWw98MZVvCYAywQVyURH7vq8Zyl0ndtEF/QyAwcx
	favf2Rrhddyy6jQpBcw1RB/zNAHleaOPzEE46QllL6Goy660dpv2Tg5Fpc0UT63dM41HaNJm5xpQf
	KtN3EK5FTa10pAJYqLprcENaGqbBk0cR148embdEjn+5CFV2CRzRMIpakVxiQ0cY8GU0vnU4YMatq
	+sMVtNVw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6EZ-00000002GyR-29fL;
	Mon, 19 May 2025 19:33:11 +0000
Message-ID: <0a6cbe7b-814b-407c-ac1c-96ab7b787d88@infradead.org>
Date: Mon, 19 May 2025 12:33:03 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge all the trees
To: Akira Yokosawa <akiyks@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org
References: <20250508184839.656af8f6@canb.auug.org.au>
 <3b35840a-7b87-44fc-8580-219ac78ad112@gmail.com>
 <20250508222531.0e7fab9c@canb.auug.org.au> <20250508143911.5d7a77d4@foz.lan>
 <879b49f5-7350-48e8-a84e-2c580a5b0ca8@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <879b49f5-7350-48e8-a84e-2c580a5b0ca8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/14/25 7:33 PM, Akira Yokosawa wrote:
> [+CC linux-doc]
> 
> Hi,
> 
> On Thu, 8 May 2025 14:39:11 +0200, Mauro Carvalho Chehab wrote:
>> Em Thu, 8 May 2025 22:25:31 +1000
>> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
> [...]
> 
>>>
>>> So, I used "KERNELDOC=$(pwd)/scripts/kernel-doc.pl" and tried again.
>>>
>>> I got these (new) messages:
>>>
>>> Error: Cannot open file drivers/virt/coco/tsm-mr.c
>>> Error: Cannot open file drivers/virt/coco/tsm-mr.c
>>> WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export drivers/virt/coco/tsm-mr.c' failed with return code 2
>>>
>>> (and a few other innocuous ones)
>>>
>>> So your guess is good.
>>>
>>> It would be nice to have the Python kernel-doc fixed as well as the
>>> devsec-tsm tree.
>>
>> With regards to kernel-doc, failing to build if a file is missing
>> is the right thing to do.
> 
> Mauro, I don't agree here.
> 
> With the perl version of kernel-doc, a typo in a file path doesn't cause
> a fatal error of docs build.
> 
> kernel-doc as python class libs ends up in a fatal error.
> 
> Here is a log of such a fatal error (on top of current docs-next with
> intentional typo made in a pathname in one of .. kernel-doc::
> 
> -----------------------------------------------------------------
> Sphinx parallel build error!
> 
> Versions
> ========
> 
> * Platform:         linux; (Linux-6.8.0-59-generic-x86_64-with-glibc2.39)
> * Python version:   3.12.3 (CPython)
> * Sphinx version:   8.2.3
> * Docutils version: 0.21.2
> * Jinja2 version:   3.1.6
> * Pygments version: 2.19.1
> 
> Last Messages
> =============
> 
>     userspace-api/gpio/gpio-get-chipinfo-ioctl .. userspace-api/media/dvb/dmx-fclose
> 
> 
>     reading sources... [ 90%]
>     userspace-api/media/dvb/dmx-fopen .. userspace-api/media/mediactl/media-controller-model
> 
> 
>     reading sources... [ 92%]
>     userspace-api/media/mediactl/media-func-close .. userspace-api/media/v4l/diff-v4l
> 
> Loaded Extensions
> =================
> 
> * sphinx.ext.mathjax (8.2.3)
> * alabaster (1.0.0)
> * sphinxcontrib.applehelp (2.0.0)
> * sphinxcontrib.devhelp (2.0.0)
> * sphinxcontrib.htmlhelp (2.1.0)
> * sphinxcontrib.serializinghtml (2.0.0)
> * sphinxcontrib.qthelp (2.0.0)
> * kerneldoc (1.0)
> * rstFlatTable (1.0)
> * kernel_include (1.0)
> * kfigure (1.0.0)
> * sphinx.ext.ifconfig (8.2.3)
> * automarkup (unknown version)
> * maintainers_include (1.0)
> * sphinx.ext.autosectionlabel (8.2.3)
> * kernel_abi (1.0)
> * kernel_feat (1.0)
> * translations (unknown version)
> * sphinx.ext.imgmath (8.2.3)
> 
> Traceback
> =========
> 
>       File "/<...>/sphinx-8.2.3/lib/python3.12/site-packages/sphinx/util/parallel.py", line 137, in _join_one
>         raise SphinxParallelError(*result)
>     sphinx.errors.SphinxParallelError: KeyError: '/<...>/lib/bitmap-bad.c'
> 
> 
> The full traceback has been saved in:
> /tmp/sphinx-err-8jzxndsr.log
> 
> To report this error to the developers, please open an issue at <https://github.com/sphinx-doc/sphinx/issues/>. Thanks!
> Please also report this if it was a user error, so that a better error message can be provided next time.
> make[3]: *** [/<...>/Documentation/Makefile:123: htmldocs] Error 2
> make[2]: *** [/<...>/Makefile:1806: htmldocs] Error 2
> make[1]: *** [/<...>/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/<...>/my-output'
> make: *** [Makefile:248: __sub-make] Error 2
> 
> -----------------------------------------------------------------
> 
> This would surprise innocent devs who are kindly willing to test docs build.
> 
> I think you need to tame its behavior and make it emit a proper warning and
> continue building docs in case of such predictable user errors.

Totally agree.
Thanks.

> Am I asking you something unreasonable?
> 
> Thanks,
> Akira
> 
>>                           As kernel-doc is now fully an Sphinx extension,
>> it now signalizes to Sphinx that the build has failed.
>>
>> Yet, it should have produced some warnings. Maybe we need to specify a
>> different log level with Sphinx to make it happen. I'll double check it
>> and send a fix later on to kernel-doc.
>>
>> Thanks,
>> Mauro
> 
> 

-- 
~Randy


