Return-Path: <linux-next+bounces-5435-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A90A336F8
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 05:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00713167114
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 04:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15DA204C15;
	Thu, 13 Feb 2025 04:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="axMJQkjW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084811C32
	for <linux-next@vger.kernel.org>; Thu, 13 Feb 2025 04:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739421491; cv=none; b=E/wMCaK4MeXnj5fkHsS1IiG4PM2jHZC0q8p/6szNbUVGBUjeQzFHjfOSx2NU9ugT/6KCNvWU45Cq9C3lRLFBFHqH/8bI5RghCLuZ23+YwmF6Ghqvud1WF2dSWAQbFXwmQA5G4um7B/1mw3elZZqpRs2NucC3yFiydaXHk9gQZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739421491; c=relaxed/simple;
	bh=Xi073yZ8BJUIbvMEhp3sOGEg+au76WHCAoRefy/re4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKQsJ6bH6ZJODILwyHm1webgjzbdJrdK2N2j7QnSdj8jDAtE0+2mKQQJiM2YMJzh94D3siUb4AW1f21XC8ZOpO3Lro09MdSMNwH4M/YgqiGUFQO21z0Zt6CIkxV4L/Im9fTUDeBeluMZCI2qctDxvYbeAof7sqc0eOEteL+VL5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=axMJQkjW; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f441791e40so710075a91.3
        for <linux-next@vger.kernel.org>; Wed, 12 Feb 2025 20:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1739421489; x=1740026289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D01JlLjK0EyNlEsFNPE/utvdsk6OKvLcRCbdJYH1Zs4=;
        b=axMJQkjWsKAtpEsFgubcZBzrat4WAZ5FDfwDSo4qUPX3br+czV+DzR/6xEern3O3aL
         PIsXWhS/w8jAuKJGqsgfVQOOkaAv1x5TRwDoiJ+QPi3lGMCQOrzJmbFNADd/2k+qDQSh
         iDFFdKH1mGvqFrFdQkwtvlnG93KuBiI0Gac0R+oo06bjy8QCid8onJcGdakSbZQ7wh8W
         S5kDp7m7Q0kSpa37XOJEbx/cPWdq138WLthyWjyRUJg01PC9l4t78B5xLVEv0/CmHuic
         cBDhGcAnQp7aGzwDrDRTD/N/o/0JvdXD2n8hIMLx+MoJ80FCid8wtjcWX22mwDzAaqN8
         Gylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739421489; x=1740026289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D01JlLjK0EyNlEsFNPE/utvdsk6OKvLcRCbdJYH1Zs4=;
        b=C53cDHdfbwo5XjP1HF8ux3FSv6GQQ7F2bt8Pk9vrf2VhJtARC3RyQIO456MnD3d+Lp
         fszy6ryu09u+Rje//MwtrBpnS508LLbLv8gRWzPg/XJWUIY+q23vw7CGqxEfRE9eXN0u
         Vt54XjjkqOlvbU+3zje/nEs3eivXPFZoCfCdhNigHwQv7m5zpdngkFRizSujywouv5kN
         rwK5+BhajWdaTa/dhsga+Fpt6oA4TndCFGjzlj/S/h66ZHjqVvCEuoe0ujydjLwvvwZw
         UwMjiNI0GxYEPh4Xv8pSzQFkLWpxmvfRkOMPsOiEZtVSCkWITqha/BodjuRNNWcHHPCr
         3zAg==
X-Gm-Message-State: AOJu0YxT+2kLwa1LXX1QScmGxwIAljJyNyimBBTWZ9FNWVHN1oSMvtTh
	PQ7rd3PtnWlQocLMCUi3Ht9N9supFK7M7MyqWP+Nd4GsccoOT3VoU0/VGJyZlik=
X-Gm-Gg: ASbGncvny4itrS3uLJTOjCay8979tUtfNehYmbUXZsoD0fH3uuVPrsEMrs593dOUsdt
	2LKBoKW0Eh00Y353M3odqVDAo3b50c41mWZeLUEVZyvIDuZcJxWayoUFsRy2bKIluE+kcRzRXRo
	Rgrp14nYP0ZOaB5AhaxZj9wWL8+1zXqn/FV3hAx+JJq9Ey+utg1uuIhBJHAzSQ3omzoa3oQgF0K
	Kgzcud4u6fbH5UA+Fu7PPXLn/fYjSUafSXhp+1Ivy5Q2q9R58tB9ZSxl6Da+Xgpsu0A4uX5OesX
	+eS6jDLENoij5vDaKxThQ0obVS6sy7VasbnhAv1XgaATNpQpuVwug3UQi5L/fJbMqw0qwbAgYaI
	t
X-Google-Smtp-Source: AGHT+IG33YThWlpDEKXPwzgLAb+celxnEBw9z8ZfaRtRYClRWWrajPqMzLjf2nJ89U2yxELC3/J8Ow==
X-Received: by 2002:a17:90b:2f03:b0:2ee:c04a:4281 with SMTP id 98e67ed59e1d1-2fbf5bc0254mr7745202a91.6.1739421489131;
        Wed, 12 Feb 2025 20:38:09 -0800 (PST)
Received: from medusa.lab.kspace.sh (c-76-103-130-118.hsd1.ca.comcast.net. [76.103.130.118])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f0facsm2331274a91.23.2025.02.12.20.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 20:38:08 -0800 (PST)
Date: Wed, 12 Feb 2025 20:38:06 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-next@vger.kernel.org, jan.kiszka@siemens.com, kbingham@kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH] scripts/gdb/symbols: follow up on refactoring for const
 struct bin_attribute
Message-ID: <20250213043806.GA2552411-mkhalfella@purestorage.com>
References: <20250112122149.9939-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112122149.9939-1-koichiro.den@canonical.com>

On 2025-01-12 21:21:49 +0900, Koichiro Den wrote:
> The work for 'const struct bin_attribute' [1] was merged into linux-next
> but did not include updates to the lx-symbols code. So it now fails with
> the following error:
> Python Exception <class 'gdb.error'>: There is no member named nsections.
> Error occurred in Python: There is no member named nsections.
> 
> Restore its functionality by aligning it with those changes on
> kernel/module/sysfs.c.
> 
> [1] https://lore.kernel.org/all/20241227-sysfs-const-bin_attr-module-v2-0-e267275f0f37@weissschuh.net/
> 
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  scripts/gdb/linux/symbols.py | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> index f6c1b063775a..8efefd30df49 100644
> --- a/scripts/gdb/linux/symbols.py
> +++ b/scripts/gdb/linux/symbols.py
> @@ -89,16 +89,26 @@ lx-symbols command."""
>                  return name
>          return None
>  
> +    def _iter_bin_attrs(self, bin_attrs):
> +        while True:
> +            try:
> +                bin_attr = bin_attrs.dereference()
> +            except gdb.MemoryError:

This should not result in an exception. The array should at least have
one element on it, that is the NULL terminator.

> +                break
> +            if bin_attr == 0:
> +                break
> +            yield bin_attr
> +            bin_attrs += 1
> +
>      def _section_arguments(self, module, module_addr):
>          try:
>              sect_attrs = module['sect_attrs'].dereference()
>          except gdb.error:
>              return str(module_addr)
>  
> -        attrs = sect_attrs['attrs']
>          section_name_to_address = {
> -            attrs[n]['battr']['attr']['name'].string(): attrs[n]['address']
> -            for n in range(int(sect_attrs['nsections']))}
> +            bin_attr['attr']['name'].string(): bin_attr['private']
> +            for bin_attr in self._iter_bin_attrs(sect_attrs['grp']['bin_attrs'])}
>  
>          textaddr = section_name_to_address.get(".text", module_addr)
>          args = []
> -- 
> 2.45.2
> 

Hello Koichiro,

I hit the same problem came up with similar fix below. Of course I am
biased and I think my change is more concise. Feel free to take from it.
Looks like many commits changed this code and any of them would break
python code. Can you please add Fixes tag at least to the top commit.

34f5ec0f8252 ("module: sysfs: Drop 'struct module_sect_attr'")
4b2c11e4aaf7 ("module: sysfs: Drop member 'module_sect_attr::address'")
d8959b947a8d ("module: sysfs: Drop member 'module_sect_attrs::nsections'")

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index f6c1b063775a..e4865ec5aebe 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -95,10 +95,15 @@ lx-symbols command."""
         except gdb.error:
             return str(module_addr)

-        attrs = sect_attrs['attrs']
-        section_name_to_address = {
-            attrs[n]['battr']['attr']['name'].string(): attrs[n]['address']
-            for n in range(int(sect_attrs['nsections']))}
+        section_name_to_address = {}
+        gattr = sect_attrs['grp']['bin_attrs']
+        battr = gattr.dereference()
+        while battr:
+            sec_name = battr['attr']['name'].string()
+            sec_addr = battr['private']
+            section_name_to_address[sec_name] = sec_addr
+            gattr = gattr + 1
+            battr = gattr.dereference()

         textaddr = section_name_to_address.get(".text", module_addr)
         args = []

