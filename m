Return-Path: <linux-next+bounces-8967-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB0CC5A624
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 23:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 508B44EB787
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 22:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C72A2D7DE1;
	Thu, 13 Nov 2025 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rnji56Cx"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D589F2ED858;
	Thu, 13 Nov 2025 22:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763073773; cv=none; b=bZfgb4SGdjgjTbNUgNoW9eKoZuG/wRnbhC8RH7rnum819rLgIRhpoS4b6ZUUOv0VL569XNU1EQx0aAxUCec11thdgWe6IanXCESb/hzeID3gYSzybOBOw0HRDPWx0tZPj79ufI7AfFcCbioFM/1zNIlb+70b8VvKSAsWi37SCGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763073773; c=relaxed/simple;
	bh=5zv6lWBb/yfuOcL6EPfSCnW86ciCQLrNvVyaEeN4JeM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XeY8poCwjmnRpnd8/wd1BvAIDhdNJx/gLmdggV2As/8ykq53jPEQWV5K/bgptD2wByGFnmdA115McFwSKdw7UZKa8/M3Hf1Cs35bwzOhJq5+iqBBQb7z4sJmNPayBhP2mPlg7jYk86eZhOhWFs5QAz0J1RAMHTQ0iD0BBXD05nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rnji56Cx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=yoCQcrlkEiNB4g4BDa7hXupUfK9eFQ61mfYoNG41mZk=; b=rnji56CxvFwB6xTAlLRU/w38AW
	WbMYdb9BDOYIgvbVZu7JHMdM65QGDPBF4AM4yJ/fwBA9LSnUOev0F5CvUE0I9NkabggeHE9SMjNuh
	6RWl35CObRvu0O/xGqiMbvcrkjMoKmFtb23zHhPgtjbw+efHx9B+Jd/+2Hf0yzf6heHmE/SRMjrp9
	EQ51NGgGr8eD0m98bkvSD7ztwDHMbUAcgEIXhYFPqNjzlV1o95s0LEAaKUbbXjRKYxvJ/cYgs0RvW
	951SPWg+kkth+5RmnE2hsERh5OISu91k2I5/5t1171SS4WbLqX/o7/K8TaUZYw48Nglu8VIsRHoLw
	Ipto+49g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJg1h-0000000BCcW-1fXK;
	Thu, 13 Nov 2025 22:42:49 +0000
Message-ID: <357e40fc-aaba-4efc-802c-e428d2454fd1@infradead.org>
Date: Thu, 13 Nov 2025 14:42:48 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of Linus' tree
From: Randy Dunlap <rdunlap@infradead.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jason Wang
 <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251113125537.0d08e5ce@canb.auug.org.au>
 <20251113091604.0a02f3bc@foz.lan> <87zf8psxz4.fsf@trenco.lwn.net>
 <20251113230135.43408a2d@foz.lan>
 <e29ba7e3-9fdb-4ae8-98a8-41c7b340224b@infradead.org>
Content-Language: en-US
In-Reply-To: <e29ba7e3-9fdb-4ae8-98a8-41c7b340224b@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 2:28 PM, Randy Dunlap wrote:
> 
> 
> On 11/13/25 2:01 PM, Mauro Carvalho Chehab wrote:
>> Em Thu, 13 Nov 2025 09:23:27 -0700
>> Jonathan Corbet <corbet@lwn.net> escreveu:
>>
>>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>>>
>>>> Em Thu, 13 Nov 2025 12:55:37 +1100
>>>> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
>>>>  
>>>>> Hi all,
>>>>>
>>>>> Today's linux-next build (htmldocs) produced these warnings:
>>>>>
>>>>> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:174 duplicate section name 'Return'
>>>>> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:184 duplicate section name 'Return'
>>>>> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:190 duplicate section name 'Return'
>>>>>
>>>>> Introduced by commit
>>>>>
>>>>>   bee8c7c24b73 ("virtio: introduce map ops in virtio core")
>>>>>
>>>>> but is probably a bug in our scripts as those lines above have "Returns:"
>>>>> in them, not "Return:".  
>>>>
>>>> It is not a mistake. What happens is that, when kernel-doc detects
>>>> something like:
>>>>
>>>> 	/**
>>>> ...
>>>> 	 * return: something
>>>> ...
>>>> 	 *    returns: else
>>>> ...
>>>> 	 */
>>>>
>>>> we have a duplicated section.  
>>>
>>> This seems like something we should be able to fix...will try to find
>>> some time to look into it...
>>
>> It is easy to fix, but it may break some things:
>>
>>
>> 	$ git grep -l -E "\* \s+returns?:"
>> 	drivers/edac/i5000_edac.c
>> 	drivers/edac/i5400_edac.c
>> 	drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
>> 	drivers/gpu/drm/ingenic/ingenic-ipu.c
>> 	drivers/misc/sgi-gru/grufault.c
>> 	drivers/net/wireless/marvell/libertas/cmd.c
>> 	drivers/net/wireless/marvell/libertas/firmware.c
>> 	drivers/net/wireless/marvell/libertas/if_usb.c
>> 	drivers/net/wireless/marvell/libertas/main.c
>> 	drivers/pci/rom.c
>> 	drivers/scsi/qla2xxx/qla_edif.c
>> 	drivers/tty/moxa.c
>>
>> And this is only for "return" section. There are also other places
>> where sections have more than one space. For instance, on 219
>> files, we have:
>>
>> 	$ git grep -l -E "\* \s+@\w+:"|wc -l
>> 	219
>>
>> like here:
>>
>> 	drivers/ata/sata_mv.c-/**
>> 	drivers/ata/sata_mv.c- *      mv_print_info - Dump key info to kernel log for perusal.
>> 	drivers/ata/sata_mv.c: *      @host: ATA host to print info about
>> 	drivers/ata/sata_mv.c- *
>> 	drivers/ata/sata_mv.c- *      FIXME: complete this.
> 
> Yes, lots like that.
> 
>>
>> So, before changing the regex:
>>
>> 	known_section_names = 'description|context|returns?|notes?|examples?'
>> 	known_sections = KernRe(known_section_names, flags = re.I)
>> 	doc_sect = doc_com + \
>> -	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
>> +	    KernRe(r'\s?(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
>> 	           flags=re.I, cache=False)
>>
>> to accept only a single space or no spaces, we need to change kernel-doc
>> markups on lots of files.
>>
>> Ok, an alternative would be to identify the indentation, but this could
>> also be problematic.
> 
> We also need to be aware that the problem does not involve only
> multiple "return:/returns:" lines. I.e., the ':' is not required.
> 
> Currently just having a kernel-doc comment like
>  * this function could break the machine but instead it will just
>  * return an error before doing that.
> 
> causes a warning.
> Just run 'make mandocs &> mandocs.foo' and you can see lots of false
> warnings.

Big OOPS! I ran 'make mandocs' on linux-next-20251112. If I use
linux-next-20251113, most of them are gone.  :)
Thanks.

-- 
~Randy


