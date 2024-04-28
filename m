Return-Path: <linux-next+bounces-2084-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0118B4E0A
	for <lists+linux-next@lfdr.de>; Sun, 28 Apr 2024 23:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C9151C2087D
	for <lists+linux-next@lfdr.de>; Sun, 28 Apr 2024 21:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2DDB667;
	Sun, 28 Apr 2024 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="n8g3U4EN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BE1C14
	for <linux-next@vger.kernel.org>; Sun, 28 Apr 2024 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714341340; cv=none; b=UDYXONAhyzHRmtCWieAuw0Pq8z2oWzvnfLdU7f1gpzjkHhQHZjMvCbyYbvRBaCbxgFKSSfYZiJsmrSOTDA6hFFl6PLNCAiAOfMu84LqegmLz2FoH+4Er0KOV7h0mhxXYVqACVy133hkgJWs5cXd5WoSgMduCWJfazVff5Ees4Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714341340; c=relaxed/simple;
	bh=ScgOd2wBjKDnKvGNi9acgC3cgiyIu1XUn7QwBXu6FgQ=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=r1/aKJdlllbcje8TGB4kx2Ua8npZ/Tj7dcuByZFaaD4TTXYmUbTL32FFLH306kO9whOl3TgPi+fudKSip9eM4mgv+L9o9q9DjpSvveiUA39lC2MlExecgvfoGS3P4GjJQv6u3mh/0xZYd5DVf2FlOBcP88qVQ4o8dyENn07JGVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=n8g3U4EN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e5c7d087e1so33152615ad.0
        for <linux-next@vger.kernel.org>; Sun, 28 Apr 2024 14:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1714341338; x=1714946138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO/d7+9spDhhnXx6X14vFoO1jgfPm5mNyx0Xt5K2WCw=;
        b=n8g3U4ENXLm7HQgi4jo8/dVAVmLLac4B9xSY3nipNAEYB8NAQwhflZhu71sIanB6GY
         wXruXXdStJgRjCGmuofdBf0MELDFbaEKB5PCinLwdJxer1pFiZS6QmWEn9YEoA7zV+pL
         kHyj6yBNh8UqhlGzxsfrA8/pO5W5KBh9/MG3fiTxxQ7CklpNc9axjBy5f1oy0Dn+bJbN
         F8yGf68rdndm+cGoIr4kdZyQEQ5NSKznEL1AleVR0J7nOB6jL5B5aqa7IDLOFnWvOxGt
         g4Q+f5RjYTa9KvWF8WgjwfzcamTEjAZjQw2X1IO5WDf7Y+RXU53FrZZivw1IP7dCpuaG
         Ag+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714341338; x=1714946138;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uO/d7+9spDhhnXx6X14vFoO1jgfPm5mNyx0Xt5K2WCw=;
        b=X3xfoXn4+AuermWZOj81YAAWxAkvlA/KjfJpVxE52dPx3dzQ2joME1AiFc799stox6
         bMLAiHiqUzKWOgwEdo3zRkpFEdDoSx2eQyyrYuc8KyjbzHUypnFCj+UTTfssZQipoX5r
         PsegSkyhoz8O7O1LsJG79WcHrx5/0/uMR0TecbJgsHvw1/yZdaNOcUxtcISvTcDmepGN
         WFc8mdn+QNESmgr/6EGktLsJvj0Inftam1Uw1MX03MwZnqFzQXyWpWH69hU5JCk5aq9G
         ki6Zje9p09a5uI3z53Y6+cb7YQVc9K4SLpUBklyRMzBCQt02nsz++w/AtK06pv4D2T5B
         8XGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMe8qhOvHYWbl02fGSrd+PWKTDEHaHIVNiruopZGxUoBZEcgQQyr0cKO866VYTPqQoZecHc/SyuwekwyLfK6bFX8iQBu20d4Yp/g==
X-Gm-Message-State: AOJu0YwNSv+5ZmGH4GTfPNpnXWKqmTF41YS1K5NP3v0fkDTInOE2zSm+
	lT5DZETF78sgrtFlnoHmIezzQV84IhANF6Of8CtRMc5TGdLj0GQtYVVLC4ngvRcJBYPOpbvL4ME
	2
X-Google-Smtp-Source: AGHT+IGHna1zy9ir5CxFiGGRtm0NX0nKtyFQ9+8oPcXcOSN6qaQkjvmKDbAd06Ee9h7SrfQ8a0fYLg==
X-Received: by 2002:a17:903:491:b0:1eb:5c0f:6e78 with SMTP id jj17-20020a170903049100b001eb5c0f6e78mr3407574plb.11.1714341337409;
        Sun, 28 Apr 2024 14:55:37 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id x6-20020a170902a38600b001eb08a304c3sm4756989pla.21.2024.04.28.14.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 14:55:36 -0700 (PDT)
Date: Sun, 28 Apr 2024 14:55:36 -0700 (PDT)
X-Google-Original-Date: Sun, 28 Apr 2024 14:55:32 PDT (-0700)
Subject:     Re: linux-next: duplicate patch in the risc-v tree
In-Reply-To: <20240429073553.503958e8@canb.auug.org.au>
CC: Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
  linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-24fa846c-974e-452c-a593-2206e8970851@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sun, 28 Apr 2024 14:35:53 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patch):
>
>   bac292e849d7 ("selftests: sud_test: return correct emulated syscall value on RISC-V")
>
> This is commit
>
>   17c67ed752d6 ("selftests: sud_test: return correct emulated syscall value on RISC-V")
>
> in Linus' tree.

Sorry about that, looks like I accidentally merge this into both 
for-next and fixes.  It's a fix, though not strictly a regression (the 
selftest never worked), so maybe I just was being too careful the first 
time.

I dropped it from for-next.

>
> -- 
> Cheers,
> Stephen Rothwell

