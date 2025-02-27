Return-Path: <linux-next+bounces-5581-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 294FCA47097
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 01:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1805016DB68
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 00:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61E22B9B7;
	Thu, 27 Feb 2025 00:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="N4VXNFQF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12294C9F
	for <linux-next@vger.kernel.org>; Thu, 27 Feb 2025 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740617978; cv=none; b=EiGF8Ces0pCaRStHeLKbNw4lxFnBx20OGSsOV60BwR9XlzmiCYrYj9fAIS0CxP9bc+/8TtDz+GX6uioX6ad20zXw09U9X9pzVegKDMAeKk8MEJJd419cwqcdzB5BHHX6bqZ2BFoVTefBqfLe8OopuHT3koRKorhwzaBNQUSR8aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740617978; c=relaxed/simple;
	bh=VWd9OgxbVmHO2LgjU8IkRr7q+KjdKSPr5STc5HGGnOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3u5Q1DWOnd1voL3CH5FetM4afIOs2zB4A5pxJJHElswxcxGdngGdJaxku9P8OZbqemSGz1sHQR48rTh5HvQ3Ny9U62C5S7qDPwcEpPjopuelzVzXBafqqVIgxHqB14hOVAu7+UAsx8Y5QQ9dlB2zlmQoCEwtplOylOGTAEzjw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=N4VXNFQF; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A39D33F5A1
	for <linux-next@vger.kernel.org>; Thu, 27 Feb 2025 00:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740617967;
	bh=0LOhFdSVk3SkZYJT02ocnx1UrDgNMytfb4SRqiZfmbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=N4VXNFQF8qjFbt0BEEXBZuc3ZbtZPr4u/x+RVeWyNDwSYzztuTYYz5Zo42WqLaF5s
	 zgQFkLHHXyzsReRwccCYn/ld+BuL6s1zfDeNPQCbdvFcDywl69XNEkGo9XCOOTnYDX
	 q11XF97WEByZtqXJJSkHFUaEUG234Dr6VPZC9TZ+u9u5O4LCJ/WOY+Iqfvkq/gjXi7
	 xNxszblXLe/73+bg4kJl5K+mhZF9YeA5EELdpsPGWh/SMMFdXl6OPB6OCrX1MoeT54
	 pz8qZqiTJaDLJevxELg8ZmQyQxA2vNIjbHbN5nda75uLUgcZP2ZjWfaUIaANo1w1LF
	 0irvxRjpETf3w==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fe98fad333so909534a91.2
        for <linux-next@vger.kernel.org>; Wed, 26 Feb 2025 16:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740617966; x=1741222766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LOhFdSVk3SkZYJT02ocnx1UrDgNMytfb4SRqiZfmbo=;
        b=BqC4o9p7AXcfeVnZ60wnsHnBtHyu+fGTdLTlzhKo7bUDHJTPRD4G5RxC2jUQvHI4br
         cXjSRfD4Rg/NxCFdnJmpGUDC1oC6suSRieK0doKZLlk0gDsIoVOVLHj/SA5xbwsiekyo
         fTBVLxkSn20tIZdRlUjjzbnUeBpP4teO7qyLbGqM0Zfkt1ivow9bLc2ciWuKnp8/ZOFE
         N0d8BOc7hS2njIW2uFk8bZUTy57PLOCZIRSw2ujGFcVDaF//memFTkRlyLiNAGS6Jb14
         SGL6BdkCIypSddPQQ4mPDntrmZsCOQr1lHKwJN2wONzK7FUG7YDggTVBvc5g8RAgg0Qp
         e1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJb/mYGF2ILyVxl2k9XuKkPLevfDHz/kiHdxRGIfCjLx8N9Z9pRPRRLCQRep108hcdyNnCQIcEIOwr@vger.kernel.org
X-Gm-Message-State: AOJu0YyujwAAExWeFmQePK3fkk8PhwLJon114/tI6pGYt9/Mi6iNdG6j
	C8HbllkXQ+jX60hdCJpvuBbnm1Kka7HrCFc350wvdNMFcY4AvGe9n7pLkKrK0IPWzI75S283HsY
	UH4Rl2nGq/LxWFX4Hd2GytaeU2EkIUy19HuP5zHWKrK61B8opBeYuSR81C52b7PBFLdeFf2qy16
	E=
X-Gm-Gg: ASbGncsiw3tDONPZOCr+ID+1DAFsv54eB3Ggc3mDECfByaR8upK7jYU73MmaKA4utp7
	NzQcxJNwmTUFX+iVmWhbVZguR8V3DOPEJas/R654J7diPaW2BdXthTUV8sFziJaryxN/AJMUHQq
	EYV0mZMha7qVPbFUZ34/UuiotuWH2Vw/CmL+Vsj5NQsk5PuWV/g59Oi1g8IkS4QgCHMLuUvTCe8
	brk/n+Z1UxPVF4bDdvoDfyFtB6hq/ulS+HX44CkFXrcoCEckYwgDiGHgCnebYJ5Bp18avbO8WUt
	oU5/Ix7q6urHwOt3nw==
X-Received: by 2002:a17:90b:4c04:b0:2fa:20f4:d27f with SMTP id 98e67ed59e1d1-2fce7b23bb5mr32362796a91.32.1740617966292;
        Wed, 26 Feb 2025 16:59:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEuWbCc1wnTNcOGj5Z5zq4WyfUzbGIdrseZjoLa4OTdGu45CMbjCZWGK/P21V7Vl6ks8gNFQ==
X-Received: by 2002:a17:90b:4c04:b0:2fa:20f4:d27f with SMTP id 98e67ed59e1d1-2fce7b23bb5mr32362780a91.32.1740617965940;
        Wed, 26 Feb 2025 16:59:25 -0800 (PST)
Received: from localhost ([240f:74:7be:1:cdfe:cd19:bffa:178c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6dec47a3sm1734477a91.2.2025.02.26.16.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 16:59:25 -0800 (PST)
Date: Thu, 27 Feb 2025 09:59:23 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Etienne Buira <etienne.buira@free.fr>, Andrew Ballance <andrewjballance@gmail.com>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH] scripts/gdb/symbols: follow up on refactoring for const
 struct bin_attribute
Message-ID: <5vhttz23b4v4fs57fv5o7e74bn2uewrmy6jdgeenwztwufjo5b@o72abjlumepw>
References: <20250112122149.9939-1-koichiro.den@canonical.com>
 <20250213043806.GA2552411-mkhalfella@purestorage.com>
 <20250227001759.GA351718-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227001759.GA351718-mkhalfella@purestorage.com>

On Wed, Feb 26, 2025 at 04:17:59PM GMT, Mohamed Khalfella wrote:
> On 2025-02-12 20:38:06 -0800, Mohamed Khalfella wrote:
> > On 2025-01-12 21:21:49 +0900, Koichiro Den wrote:
> > > The work for 'const struct bin_attribute' [1] was merged into linux-next
> > > but did not include updates to the lx-symbols code. So it now fails with
> > > the following error:
> > > Python Exception <class 'gdb.error'>: There is no member named nsections.
> > > Error occurred in Python: There is no member named nsections.
> > > 
> > > Restore its functionality by aligning it with those changes on
> > > kernel/module/sysfs.c.
> > > 
> > > [1] https://lore.kernel.org/all/20241227-sysfs-const-bin_attr-module-v2-0-e267275f0f37@weissschuh.net/
> > > 
> > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > > ---
> > >  scripts/gdb/linux/symbols.py | 16 +++++++++++++---
> > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> > > index f6c1b063775a..8efefd30df49 100644
> > > --- a/scripts/gdb/linux/symbols.py
> > > +++ b/scripts/gdb/linux/symbols.py
> > > @@ -89,16 +89,26 @@ lx-symbols command."""
> > >                  return name
> > >          return None
> > >  
> > > +    def _iter_bin_attrs(self, bin_attrs):
> > > +        while True:
> > > +            try:
> > > +                bin_attr = bin_attrs.dereference()
> > > +            except gdb.MemoryError:
> > 
> > This should not result in an exception. The array should at least have
> > one element on it, that is the NULL terminator.
> > 
> > > +                break
> > > +            if bin_attr == 0:
> > > +                break
> > > +            yield bin_attr
> > > +            bin_attrs += 1
> > > +
> > >      def _section_arguments(self, module, module_addr):
> > >          try:
> > >              sect_attrs = module['sect_attrs'].dereference()
> > >          except gdb.error:
> > >              return str(module_addr)
> > >  
> > > -        attrs = sect_attrs['attrs']
> > >          section_name_to_address = {
> > > -            attrs[n]['battr']['attr']['name'].string(): attrs[n]['address']
> > > -            for n in range(int(sect_attrs['nsections']))}
> > > +            bin_attr['attr']['name'].string(): bin_attr['private']
> > > +            for bin_attr in self._iter_bin_attrs(sect_attrs['grp']['bin_attrs'])}
> > >  
> > >          textaddr = section_name_to_address.get(".text", module_addr)
> > >          args = []
> > > -- 
> > > 2.45.2
> > > 
> > 
> > Hello Koichiro,
> > 
> > I hit the same problem came up with similar fix below. Of course I am
> > biased and I think my change is more concise. Feel free to take from it.
> > Looks like many commits changed this code and any of them would break
> > python code. Can you please add Fixes tag at least to the top commit.
> > 
> > 34f5ec0f8252 ("module: sysfs: Drop 'struct module_sect_attr'")
> > 4b2c11e4aaf7 ("module: sysfs: Drop member 'module_sect_attr::address'")
> > d8959b947a8d ("module: sysfs: Drop member 'module_sect_attrs::nsections'")
> > 
> > diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> > index f6c1b063775a..e4865ec5aebe 100644
> > --- a/scripts/gdb/linux/symbols.py
> > +++ b/scripts/gdb/linux/symbols.py
> > @@ -95,10 +95,15 @@ lx-symbols command."""
> >          except gdb.error:
> >              return str(module_addr)
> > 
> > -        attrs = sect_attrs['attrs']
> > -        section_name_to_address = {
> > -            attrs[n]['battr']['attr']['name'].string(): attrs[n]['address']
> > -            for n in range(int(sect_attrs['nsections']))}
> > +        section_name_to_address = {}
> > +        gattr = sect_attrs['grp']['bin_attrs']
> > +        battr = gattr.dereference()
> > +        while battr:
> > +            sec_name = battr['attr']['name'].string()
> > +            sec_addr = battr['private']
> > +            section_name_to_address[sec_name] = sec_addr
> > +            gattr = gattr + 1
> > +            battr = gattr.dereference()
> > 
> >          textaddr = section_name_to_address.get(".text", module_addr)
> >          args = []
> 
> ping
> 

Sorry for the delayed response.
I have no objections. Please go ahead and submit your patch. There is no
need to mention this original submission, nor CC me.

Thanks!

