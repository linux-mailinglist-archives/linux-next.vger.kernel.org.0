Return-Path: <linux-next+bounces-6463-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A388AA493D
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 12:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C56D7173F88
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 10:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AF021ADB0;
	Wed, 30 Apr 2025 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="yIw+v3Wl"
X-Original-To: linux-next@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE8C140E34;
	Wed, 30 Apr 2025 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010298; cv=none; b=LURvirLYWQGvLcvpA03Gxf7TBwfnH74KXACOKx7Y+AK2HAmC5/+vO2VRRbazXWlWEhLcuTCQBcgU2OTg2bD6Zs7BBSrGhJ7OBX/Y+hwqdQWxJr529QjVgmpztVM9wb/29IqA42C2n2k8G2pO1qAnXgyGim+OuIijYMKC5PZgvFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010298; c=relaxed/simple;
	bh=V7iAPQqOmoF/O1OXq1Sbzh8qpXPEsRZ8ROMvqXj81CY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHHcMfagB7WneUSCZQVmabWpoI/o8v8qazG9fKuXmHNRC5DIscf4YbghLiR99abXs6aAL3sy1saLdNPRQa4HEOfzft+9m8zyDGVSv5BTjAZjGOer+1LyGU3RZb0qEJvfOnVDRrqVLgYdy3VhSXB6V4rhBNTavQOdg5S9zb9TPro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=yIw+v3Wl; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 22A3D2E08E8D;
	Wed, 30 Apr 2025 13:51:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746010286;
	bh=9wWeGTwck9cQKoXA+Cw29FQixCUyMz9GrplRuEXpa9M=;
	h=Received:From:Subject:To;
	b=yIw+v3Wliwt0Qub10E0ZqaZll5wbFrmzo8RBWeqFDEgdEc/4nw/cbyFPpRwfWzf1L
	 JYmWSPLEud7QRbYRlb2khky7sUdEe/BNhGyni/oLncsMtZOCvmz+92uEh66oi/tbvW
	 706sBoBMqYUweyJtH35X4KJ0R/TRUDQu1gokJrVg=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f175.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30c416cdcc0so70102751fa.2;
        Wed, 30 Apr 2025 03:51:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVmF9ise3yimweXd7wcXhZhjd8rXt33K4BH64MBiobJDq9UEkr8+RYpRF+0vpdfwkHoDNVHQWYM/C1y2k4=@vger.kernel.org,
 AJvYcCXjZjcktDJIOgghQWSIxeP4iN1U3m+6Ld3Yxw1Jl2xmkvuVBcFnxXDE3KcNUlW59OsZD4iIbEeZHnmj5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx+ph2xJIw/SlHilphvh7RGoH+H764vhH1CQnWMeN5GjrHubJg
	EYZMVdEXJt3n2oMX7m7zbLt5skyNf2HkTNYeva8f5kf53TJjRzSda+ag364ObVpWQa2H1WhJECM
	hlg5YfDt+Pju9G/y5oBkXXEi+y+w=
X-Google-Smtp-Source: 
 AGHT+IGvRFag6/+N/X79gcDNxA2yVgOBaG5b1ppkZPLX4ucqtLNThMNUkYfMcEIH8do8abXCew3SECz5KE4DhOAQRms=
X-Received: by 2002:a05:651c:19a1:b0:30b:bdb0:f09d with SMTP id
 38308e7fff4ca-31ea45ca5bemr7927481fa.32.1746010282517; Wed, 30 Apr 2025
 03:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430204517.75d88615@canb.auug.org.au>
In-Reply-To: <20250430204517.75d88615@canb.auug.org.au>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 30 Apr 2025 12:51:11 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEd3B3H4iKjn5YrLOzHpXajqsPVEVVmzHc=wEAz23AR4g@mail.gmail.com>
X-Gm-Features: ATxdqUH0_kwmRpdLRoxQnxD51z3-ZdL5e_QuBRF0VLpQPuo1p8Vw9XfP0y7ApnM
Message-ID: 
 <CAGwozwEd3B3H4iKjn5YrLOzHpXajqsPVEVVmzHc=wEAz23AR4g@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174601028353.15909.12244521786516013348@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Wed, 30 Apr 2025 at 12:45, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to nonexisting document 'hwmon/oxpec' [toc.not_readable]
>
> Introduced by commit
>
>   fe812896e55d ("platform/x86: oxpec: Move hwmon/oxp-sensors to platform/x86")

Hm,
after removing the documentation I might have left an erroneous oxcec
entry in the documentation file.

In some previous versions of the series the hwmon doc file was renamed
but in the final one it is removed. So this file should not be introduced.

Should I do a fixup commit?


Antheas

>
> --
> Cheers,
> Stephen Rothwell

