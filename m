Return-Path: <linux-next+bounces-2490-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C98FF7F7
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 01:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBE6A1F249AC
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 23:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D070413DB92;
	Thu,  6 Jun 2024 23:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NOyzSHuX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79CD4F615
	for <linux-next@vger.kernel.org>; Thu,  6 Jun 2024 23:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717715533; cv=none; b=mNn4nk0mMWhNFyKp/hDd5Y7bD5YmM7w/uAMi5bR3lvm6m+hSysh6kXHDbBKK4Yft8Qp97l4qzIAcaPot8TRGXmjiWqOLw6YOB5m/BzN3r2R0CXFC0uuqu8UV0VK1DOM2o8O8gOANmtmJRNdFNtwXtjDheUqB70J+eJQRINNqMCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717715533; c=relaxed/simple;
	bh=9RCInlrJLxjHHfqXM0YBqh+KyU635HQ7qyOQspDvHlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qBCstlANmfKR2ztOTlj3iEATCg614iI23fh+S2PN4vzoupSQ3XbrMYdVKpNAh6bATP9KLPhRKrZlONK2pJmFCIXzTutiUxP79QAt4a8NfrX9MgVu/fbeitg5xeDHrey7MH1TEH8NdwuGwrL7nCg9YwmsXIU0j4GtfsUYr02Rwp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NOyzSHuX; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e72224c395so14437811fa.3
        for <linux-next@vger.kernel.org>; Thu, 06 Jun 2024 16:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717715530; x=1718320330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gHxOmY66PMBikRA71tJKrKC9swHys5sCI0tLSM2/7xc=;
        b=NOyzSHuXbQrmiAM7p6onal8wPENk+IcWWEPI/0Iz5zcutFD2xBcYcQqdJzmThf7DfN
         XFjaUbNK6Pd0r4jr/qEvTdlNn4P99RUUSwrKHSIRmU7F5yYFylpyfEUgjG8u9mbeUyqc
         PIsZZQwfOxbnRy6Q4C81hOct5zyD1cIv6Gjbx6aTIZ0slbWKh5Z+j3MUXsXuTBaYaUBe
         todhu6C57T6Hdqqgj9wG/DaP6I/k5FdqJVeykpM8zHbdHKU95gbfCswa77wA8cIMvjfa
         Ps+idPnDCNwYyazuqSYuGC1A4TLBc9W/LwVgcPcU0hL4AEZ6gjwNNaaVxVsP7WRZHTPq
         LvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717715530; x=1718320330;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHxOmY66PMBikRA71tJKrKC9swHys5sCI0tLSM2/7xc=;
        b=Cn+9tD7Tj2dhhkS51S+7HRThIAngnG+XPHZLEIkUrMRjZTfCGTiRPKnHcOLyckdlMO
         y1cegkuiWKEJHkEdXwUayczUIgWeTM8qzPx2EUjtaIsRxssOk136qrOrSg3QhzKJaqlW
         ybD1+b4POra6KGertFvBtp8M07L3ctOQom2+Hj50ZRZVWr20snjfyJRk4F/SH6fFHNlS
         Bu/9VRefMCRbnsNO+OYRfccwwyQYURnrkvYJSnHwqilRzhv5od92dRrv9IybxWIcGmqf
         cfgBH08fFCBx3QuS7qqpC/1SIEmnh9B7Sjn+p7uR/5Wr0MznXv05sF2YwZdIHxU4+vsC
         ZZkA==
X-Forwarded-Encrypted: i=1; AJvYcCXIo81DYIad648VhnAoBU59oP+gt10rzE5lWL7iuvl+mevLmou1W6F61Gi5AgMvAwDGkmUPS1G5gwmTw1Qr/J0hPh2QDwIn8h80YA==
X-Gm-Message-State: AOJu0YzT3lKLn0d4vb1ZBtbuO8/Y0nnflB2/44m8bOrxmNLgHaERsaCn
	1zxkEMdsJEWaDarRORdSrhwD1IgrN9E8PPTLLRJdXEYkUG+vmsHlWxujABgtbnw=
X-Google-Smtp-Source: AGHT+IFkwvyyGaIV8j/6Y+JqLICb1PTXzPQt4MCr/hgT0t7zIDfVr195pbzGR02j+I9X2fuSSPmY5w==
X-Received: by 2002:a2e:2c19:0:b0:2e9:84f9:3e17 with SMTP id 38308e7fff4ca-2eadce9253dmr6129301fa.50.1717715529655;
        Thu, 06 Jun 2024 16:12:09 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28066d57esm4262228a91.19.2024.06.06.16.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 16:12:09 -0700 (PDT)
Message-ID: <8697c785-8724-448d-8cba-65e81a9c4d6a@suse.com>
Date: Fri, 7 Jun 2024 08:42:03 +0930
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the btrfs tree with the btrfs-fixes
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240607085525.30555161@canb.auug.org.au>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJjTSJVBQkNOgemAAoJEMI9kfOh
 Jf6oapEH/3r/xcalNXMvyRODoprkDraOPbCnULLPNwwp4wLP0/nKXvAlhvRbDpyx1+Ht/3gW
 p+Klw+S9zBQemxu+6v5nX8zny8l7Q6nAM5InkLaD7U5OLRgJ0O1MNr/UTODIEVx3uzD2X6MR
 ECMigQxu9c3XKSELXVjTJYgRrEo8o2qb7xoInk4mlleji2rRrqBh1rS0pEexImWphJi+Xgp3
 dxRGHsNGEbJ5+9yK9Nc5r67EYG4bwm+06yVT8aQS58ZI22C/UeJpPwcsYrdABcisd7dddj4Q
 RhWiO4Iy5MTGUD7PdfIkQ40iRcQzVEL1BeidP8v8C4LVGmk4vD1wF6xTjQRKfXHOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJjTSJuBQkNOge/AAoJEMI9kfOhJf6o
 rq8H/3LJmWxL6KO2y/BgOMYDZaFWE3TtdrlIEG8YIDJzIYbNIyQ4lw61RR+0P4APKstsu5VJ
 9E3WR7vfxSiOmHCRIWPi32xwbkD5TwaA5m2uVg6xjb5wbdHm+OhdSBcw/fsg19aHQpsmh1/Q
 bjzGi56yfTxxt9R2WmFIxe6MIDzLlNw3JG42/ark2LOXywqFRnOHgFqxygoMKEG7OcGy5wJM
 AavA+Abj+6XoedYTwOKkwq+RX2hvXElLZbhYlE+npB1WsFYn1wJ22lHoZsuJCLba5lehI+//
 ShSsZT5Tlfgi92e9P7y+I/OzMvnBezAll+p/Ly2YczznKM5tV0gboCWeusM=
In-Reply-To: <20240607085525.30555161@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/6/7 08:25, Stephen Rothwell 写道:
> Hi all,
> 
> Today's linux-next merge of the btrfs tree got a conflict in:
> 
>    fs/btrfs/extent_io.c
> 
> between commit:
> 
>    d202776a44d5 ("btrfs: protect folio::private when attaching extent buffer folios")
> 
> from the btrfs-fixes tree and commit:
> 
>    46cda5a0ef68 ("btrfs: fix a possible race window when allocating new extent buffers")
> 
> from the btrfs tree.
> 
> I fixed it up (I just used the latter) and can carry the fix as
> necessary.

Please use the one titled "btrfs: protect folio::private when attaching 
extent buffer folios" instead.

The one titled "btrfs: fix a possible race window when allocating new 
extent buffers" has a bug that would lead to a crash when a race happens.

> This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

The "fix a possible race" one is originally a RFC without proper root 
cause pinned down, nor enough determining tests.
Considering it's an urgent bug we're pushing that RFC fix for testing.

But now we have pinned down the root cause and have done enough tests, 
the older RFC one can be gone.
Sorry for the inconvenience.

Thanks,
Qu

