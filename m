Return-Path: <linux-next+bounces-5400-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD5A2E2E5
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 04:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 999147A293B
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 03:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C671B12A177;
	Mon, 10 Feb 2025 03:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XaMscaj/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81046447
	for <linux-next@vger.kernel.org>; Mon, 10 Feb 2025 03:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739159096; cv=none; b=Oq1X8lzaz6eLwunVSVzQWxd/FqRmPL0qaTrtwr5DlFg6IsHEpHO5elbXksAaZfz29yjTR6/2lm1La08ccCVj5Jhs/pnmQDNFZpDxSlmKSHjoPC1awWhsmd2pCdrgizkhuOz0iya/I7ckypVpTSSTQYx8HsHH6aP9W30P4RANOwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739159096; c=relaxed/simple;
	bh=0nCoqThfV7JzU/lrvBsrVnQ5K70lAkvyl0zr6QNoIDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nk83XNs3QboTAecq4OMpsfnJXND+I45TexNdNqQAMcY0v0VScQdnfQktFs22T0ZHZ/5ZxpzCi9iAPd34WB3YtmWIKROZmTVk9L8KuuOCgRzBbCE+cXbEWXHSpQRjg7bN+DKQ0BG4AOYWtryQVhpCGyuXZtoY6EWyxuOSZpsG8ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XaMscaj/; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f9c2d2dbc2so17878317b3.0
        for <linux-next@vger.kernel.org>; Sun, 09 Feb 2025 19:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1739159093; x=1739763893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBEN6TEYczOjdTLYzUwaTfQZO7NAknquIzu0gPVIg2s=;
        b=XaMscaj/cytOthVkFQdGZc+IccWOX5AXYYP3gRFPldK/2bopp+XT0vBWmKQMQvw8Jz
         xSrvi5aDXg8RInKSeEHTnNmahFjJm5i2+33pBw4/l9YRYW0omifWY6JgaafBC8JEDxgi
         Un+d4EDvvZVv8z5dZehVLHpgqiczg96FRZxla7cYCKfx2QpOBBIvLzmCehvzhIc6TK37
         35HADgO0rv6vr1pjOyouqxBCGWOnXdb6co2vTNhKfixctq7up1TrkZINXFCWsHmKHe0a
         lpkaJf7Y5KSoL49YAqYbyRFV2BEQGk95ZJEtXX/8ZQDlDFjZ3MownHsMDGT6NIjwbIs3
         wSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739159093; x=1739763893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBEN6TEYczOjdTLYzUwaTfQZO7NAknquIzu0gPVIg2s=;
        b=GAscXn7yMXF5gzKFFGSEjB9HUwfS63BOws0WFZbIeEF7wD5x6+J4krgwfGxFNfa5y4
         34F/8/+W7DQMwnzuDSc3LcD2fJCXv+APeGqiTmJlGZoMCAr5iW8+uj8UDOILh0yl9STE
         7z/pF/gcRJ/uThb1ASG6EszKEQNsuzTm8Is5bQLYCj11u+dQXJsi4ZK3apAvZSgpL2Ol
         lsy6P4pJSKu2BQHUVQYnphioS3WdJj75DFmcLICI9RP+gjlX/MdmOeHk8SZEgq+0H8kL
         rhdsNYRwXhPFvo/EfIoczU+gTULdKyxYWdqFDDynGROu1vCMmpMgPSvk8d9k224qlrvd
         h19g==
X-Forwarded-Encrypted: i=1; AJvYcCW732mwW3vN5oSrxfpvDwUFRVmgSd1POzKI6mkYtXjMfwR9FbMB4mNR1Kj8YfbWZsoPDAm+qI2cnASH@vger.kernel.org
X-Gm-Message-State: AOJu0YwmlFAt8DXZRSFX9TKxyWzI1qI4UNuP/NjA6fnYXlQvcVe7Gxue
	RFyavzjpSHAD6QeiTeh5jNjS5wfOktnGxQtOoU4pWktzys1WI0BtZk77xVC7bWboqY9SH3vAnd/
	jB/jeqjYPlmhJsZauGZFX8lO2pS1p1ZdOxoT6rHFo2oElAWETqQ==
X-Gm-Gg: ASbGncun4vpuIvaYDPKnNSytXW5ErYN8cxe7wm2YJtvMLNODmg8fZ5HXP61ZGK6z2ZM
	vWauU/eSCrQrYUnpalJn3aEzbhNZVep7ALEM8ehKZeFj6XtJBHAvS8mo24SfjmhBz0rV/M/Q=
X-Google-Smtp-Source: AGHT+IHw7/KlrLWysVD7IZKm+l7vRn0CxbcxbPhU2cfiOgWPfmKoH71COSVrEoXC25g5XPkYovcDWs4W1zXF2Hoevbw=
X-Received: by 2002:a05:690c:6ac5:b0:6ef:7370:96ee with SMTP id
 00721157ae682-6f9b28495f5mr104323317b3.12.1739159093380; Sun, 09 Feb 2025
 19:44:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210121813.3e24cdaa@canb.auug.org.au>
In-Reply-To: <20250210121813.3e24cdaa@canb.auug.org.au>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 9 Feb 2025 22:44:42 -0500
X-Gm-Features: AWEUYZl4HiSh_hK-CiCIIkpLMm2BTiW92N6V6GZjo9Pq6Ub6xL5qH8PIBGYKVu4
Message-ID: <CAHC9VhSJceL2PmFw1RiQEd9B3c7wjt6i_KzFxUjVdHV-Zxdyzw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the security tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 8:18=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the security tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> In file included from include/linux/perf_event.h:62,
>                  from arch/arm/vfp/vfpmodule.c:21:
> include/linux/security.h:2379:12: warning: no previous prototype for 'sec=
urity_uring_allowed' [-Wmissing-prototypes]
>  2379 | extern int security_uring_allowed(void)
>       |            ^~~~~~~~~~~~~~~~~~~~~~

Thanks Stephen, I just pushed a fix to the LSM tree, it should be
fixed on your next pull.

https://lore.kernel.org/linux-security-module/20250210034132.8448-2-paul@pa=
ul-moore.com/

--=20
paul-moore.com

