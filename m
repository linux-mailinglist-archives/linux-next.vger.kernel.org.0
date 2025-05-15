Return-Path: <linux-next+bounces-6779-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46BAB7BA8
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 04:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 522288C181D
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 02:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0367286897;
	Thu, 15 May 2025 02:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNAP8jXI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8F242D61;
	Thu, 15 May 2025 02:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747276442; cv=none; b=klJEJlIqC6ywRWY5Lq2jgVH5zIOAVxqTO6ov37q2AB7PCU+/NS7VWbIrjdf3QehOxCvxjdYLMgEQ00C1LyuSTwY7ltrfRy1LyAcMduxMQ5wM9jKFQUiFy8qmlWEC9V8cAg12BBOhEIt8L5on6VGoTLSCG7M/PVIcpvo1OJy4eGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747276442; c=relaxed/simple;
	bh=hPGiRiv5V/5eBwT9eqRBSUagayubbqJPRFPyfgwV1Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6z029yRRSgQp/JT8sFC2dW0NR1nijwUZ/8jTfewdKmzokzEr892yBtodhTxUIhgYe9wTCbVTQfcmcLnKbPqpDwrjph5N3HjirONtav6oFQHoEhsUU0L7Em0LvKi3XdIOiSJdDLdid9hIftVKVC7JKJuE3fdL7k+qijZxV/zKFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNAP8jXI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7411f65811cso494890b3a.1;
        Wed, 14 May 2025 19:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747276440; x=1747881240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=plirSZS3Umg5IN7SzM6Sc8JXPbG9h2CH4yAqjcjZ1PM=;
        b=dNAP8jXIw2JJaC2Z2Nen/buEVnMx34yfy/MyKD6RFfl/QBIRmBINaWn9uAT/C1mzsO
         ZN/tNL1lFsb7DRVLmlcu2Uk4a28QQo1BeTHooE8v67wPqg8CAsT4H8Lv7UC8lShgtUzf
         qstwGtgRZdirO5pLEm8PXveKPg7vFsSjrgSeZnM94yjt6bATDcbVyeDM0MhEnfq3DWG2
         Lcnfhrzkt1DNOrGP/sz3SkQG+CHPUJKaQxWkDCZxQYigBGY0sEypdH7mV6bOnMmTOInV
         DKOmo9QdJnrtKpMHD6VVL29lCVFxoDtiDcgBXy2TlZyX215Qo4SEzdUGcRhllAxOqHqP
         XjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747276440; x=1747881240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plirSZS3Umg5IN7SzM6Sc8JXPbG9h2CH4yAqjcjZ1PM=;
        b=goH7OetqoOnUIWkQY4kZbP890DPWPyhsINEOTJSVl1Nhfy8Py1k10UW5SXlrj7tau1
         QzBTdaPvB3e6Q6sNnl/IRDNE5puJcgiZuEIGbuzTZC0s78XQEQz5QnL0qasO+Pn/yHfO
         XA6sNDTqCYmQyrSsT7Oh3m23CQJpKeIbBx/h3IOzVvEj1QLZ5PfTTrR7SDwEAVgav53l
         afkOfBoNEHQbWyL/H6zJf/RalWqAW8swGKhMNZws1k75aI+7ueyK2xzV0siS68GiYW6a
         2EitvXuHDBXK9O2EdgIQV4KOx4ABcvCPedjD4CvJGUx9fRGEWZuOS8Sk1FlJbZzTIIro
         72Cw==
X-Forwarded-Encrypted: i=1; AJvYcCULM95gYk5Svmr1XCxzs6mhsI8/+z21+72uoAy42AHAFYAP92BygqGUKixBsIgJxkTgxVDv0E07tQgQ7w==@vger.kernel.org, AJvYcCV6E0rOslmXs9Mg3CfPx+EjE0/V6zkVUJNPuTTmAYrC+Aw6okgs+xeOdUCtGrt4IFs4oLAol9wRHW4=@vger.kernel.org, AJvYcCWP3VKs2xg+dqZyUNQ2pur4oe2cYaWY4ulX/zwtRQDpBWiIX1mPGOrQrC4n2aA+B9xe55glCoHloteCm9Sz@vger.kernel.org
X-Gm-Message-State: AOJu0YyJMFDRgGelASZUrdqCB4AS2pCP9SoWJMUrT3T0rmL5KP10Cq/U
	Aa2K9Nf5kom1TeieMHxVPwKXyan2gf1PzQIL7R89OBDIWFCI8nSX
X-Gm-Gg: ASbGncu022MhP6lFmBXVGZyGbG8Ljb6xSo5k80Cj6phiPJ4rhtDpMIMNqfFaf8hAN0Q
	l4HaCzxeHMOTO7DoQcdlGFfur1dNAxVb9KjsUewZOjzsB0F3b+wqw+otEPFrY9IrTEjegcSlZvm
	MCxfiBw9J0/yhhiUZfgcybNLOVaE+T36WgMvqcDOQgN9m21VXzEczHcqs1vKWYbllIPd5BGShck
	0xFABD8NZ7DIAYYFxFEX/0AeKxYpOvV2oaOO4NwDdJ4A6Fo5FJjxsRbq72Ejpog7+tWK8oRxWh8
	WlUgjaiBfBxrr2J1ZO0kVGpBQx/2fANgfNQ9wc4XsAmZmK3FxQnOfMk+R4VGPGmJVEC7oX1l9b7
	fSPXb08UhUa7Lc3BENt8xPw==
X-Google-Smtp-Source: AGHT+IEBmuZ5OKTC7/G0rgZ3vGZnUopkbLTdWoHdraEp7/e8ePDaLszUsNz3ddo5f6GzeL/NobcqBA==
X-Received: by 2002:a05:6a00:1897:b0:736:4fe0:2661 with SMTP id d2e1a72fcca58-742984f607amr1354352b3a.11.1747276439861;
        Wed, 14 May 2025 19:33:59 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a10608sm10472077b3a.101.2025.05.14.19.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 19:33:59 -0700 (PDT)
Message-ID: <879b49f5-7350-48e8-a84e-2c580a5b0ca8@gmail.com>
Date: Thu, 15 May 2025 11:33:56 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge all the trees
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Akira Yokosawa <akiyks@gmail.com>,
 linux-doc@vger.kernel.org
References: <20250508184839.656af8f6@canb.auug.org.au>
 <3b35840a-7b87-44fc-8580-219ac78ad112@gmail.com>
 <20250508222531.0e7fab9c@canb.auug.org.au> <20250508143911.5d7a77d4@foz.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250508143911.5d7a77d4@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[+CC linux-doc]

Hi,

On Thu, 8 May 2025 14:39:11 +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 8 May 2025 22:25:31 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
[...]

>>
>> So, I used "KERNELDOC=$(pwd)/scripts/kernel-doc.pl" and tried again.
>>
>> I got these (new) messages:
>>
>> Error: Cannot open file drivers/virt/coco/tsm-mr.c
>> Error: Cannot open file drivers/virt/coco/tsm-mr.c
>> WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export drivers/virt/coco/tsm-mr.c' failed with return code 2
>>
>> (and a few other innocuous ones)
>>
>> So your guess is good.
>>
>> It would be nice to have the Python kernel-doc fixed as well as the
>> devsec-tsm tree.
> 
> With regards to kernel-doc, failing to build if a file is missing
> is the right thing to do.

Mauro, I don't agree here.

With the perl version of kernel-doc, a typo in a file path doesn't cause
a fatal error of docs build.

kernel-doc as python class libs ends up in a fatal error.

Here is a log of such a fatal error (on top of current docs-next with
intentional typo made in a pathname in one of .. kernel-doc::

-----------------------------------------------------------------
Sphinx parallel build error!

Versions
========

* Platform:         linux; (Linux-6.8.0-59-generic-x86_64-with-glibc2.39)
* Python version:   3.12.3 (CPython)
* Sphinx version:   8.2.3
* Docutils version: 0.21.2
* Jinja2 version:   3.1.6
* Pygments version: 2.19.1

Last Messages
=============

    userspace-api/gpio/gpio-get-chipinfo-ioctl .. userspace-api/media/dvb/dmx-fclose


    reading sources... [ 90%]
    userspace-api/media/dvb/dmx-fopen .. userspace-api/media/mediactl/media-controller-model


    reading sources... [ 92%]
    userspace-api/media/mediactl/media-func-close .. userspace-api/media/v4l/diff-v4l

Loaded Extensions
=================

* sphinx.ext.mathjax (8.2.3)
* alabaster (1.0.0)
* sphinxcontrib.applehelp (2.0.0)
* sphinxcontrib.devhelp (2.0.0)
* sphinxcontrib.htmlhelp (2.1.0)
* sphinxcontrib.serializinghtml (2.0.0)
* sphinxcontrib.qthelp (2.0.0)
* kerneldoc (1.0)
* rstFlatTable (1.0)
* kernel_include (1.0)
* kfigure (1.0.0)
* sphinx.ext.ifconfig (8.2.3)
* automarkup (unknown version)
* maintainers_include (1.0)
* sphinx.ext.autosectionlabel (8.2.3)
* kernel_abi (1.0)
* kernel_feat (1.0)
* translations (unknown version)
* sphinx.ext.imgmath (8.2.3)

Traceback
=========

      File "/<...>/sphinx-8.2.3/lib/python3.12/site-packages/sphinx/util/parallel.py", line 137, in _join_one
        raise SphinxParallelError(*result)
    sphinx.errors.SphinxParallelError: KeyError: '/<...>/lib/bitmap-bad.c'


The full traceback has been saved in:
/tmp/sphinx-err-8jzxndsr.log

To report this error to the developers, please open an issue at <https://github.com/sphinx-doc/sphinx/issues/>. Thanks!
Please also report this if it was a user error, so that a better error message can be provided next time.
make[3]: *** [/<...>/Documentation/Makefile:123: htmldocs] Error 2
make[2]: *** [/<...>/Makefile:1806: htmldocs] Error 2
make[1]: *** [/<...>/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/<...>/my-output'
make: *** [Makefile:248: __sub-make] Error 2

-----------------------------------------------------------------

This would surprise innocent devs who are kindly willing to test docs build.

I think you need to tame its behavior and make it emit a proper warning and
continue building docs in case of such predictable user errors.

Am I asking you something unreasonable?

Thanks,
Akira

>                           As kernel-doc is now fully an Sphinx extension,
> it now signalizes to Sphinx that the build has failed.
> 
> Yet, it should have produced some warnings. Maybe we need to specify a
> different log level with Sphinx to make it happen. I'll double check it
> and send a fix later on to kernel-doc.
> 
> Thanks,
> Mauro


