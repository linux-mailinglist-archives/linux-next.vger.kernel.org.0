Return-Path: <linux-next+bounces-5473-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBEDA3891B
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 17:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E773AA444
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 16:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D39224B1C;
	Mon, 17 Feb 2025 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AlW1oC44"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2602248B6
	for <linux-next@vger.kernel.org>; Mon, 17 Feb 2025 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739809705; cv=none; b=heQucFEGCBamSQ67EgmFF1o/ahZpGneLkq95q5UFbvtUZwYTRZikIPfdrFVlvk7A5v7tXsnEnctXJIjMGax4oIqBpCyAPx3V0svfiRi5OZhVQULxZ35zlqGEcjVWSKjqX0W9PW4Uquz/Bw1i1cNuZ8Qecq1jrsr+6jlLAcnw6qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739809705; c=relaxed/simple;
	bh=xsLMSfj1VEdYuqIej3x3D6/4UOd70zugyUhuwJwli4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxmMlDLsYTRT2d7hAZ2FD4C39d5XxrKivSanaHSo+oQ4dBUHWLOszeHBcrzH6NLgbD9IS8htsPNL7QrVLpTUHpU0XnX4qfBSGE/Ei4Z4TR582eZqZbcgq7LaH+6/ycLG8+QKOLZ8/b51hjjOpdi/Gs+BQLMCcD+TtAEL28tCQJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AlW1oC44; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-471f1dd5b80so216621cf.1
        for <linux-next@vger.kernel.org>; Mon, 17 Feb 2025 08:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739809703; x=1740414503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95spON9hLuQ6bBnBVCFPCtuSrKFhHu45XBLog4+BEpk=;
        b=AlW1oC44iSA4x3crV1oLTWNFkEZzzmIAdRP5u9nPqusl29Ih+L7jdR00oH7FKH1Rca
         O1d0ZLbl/39ydLcRi2lIlcnbQG4YEHdwaoY5MekalpaLG2kqW2h6FJiPz7Pk9W3Ff/lT
         rSSwI+S3KpOCunEixHw4YAYY7NO2UydLeX0YUuCUSQcBS0ORQhH1wlga9l/qY0/lJfJN
         sqfAC48GeotoPzJb/pgS0aolOiyodDntLCcHptpudvoI79MIlV9nxKT9DZJ3pBT/iUm1
         gB06wR+KepDdDMEspxXmO+9M8Uih0xhaTEgfhXkEDkZn/0t/hFfyYbr3E5LLHlexdJX1
         4Npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809703; x=1740414503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95spON9hLuQ6bBnBVCFPCtuSrKFhHu45XBLog4+BEpk=;
        b=k2cRpQGMLXSzq5gYiJWOLN/KENjH+xjx3242APYWOQHfqY9lSwS34uMzxUKldkIgFF
         C98Q2eLmFDz9IB7SldXXR2vJhDcbAbmAsW6tu2CqR0RX23XjHhNLXEi4crvkFZL8cmfv
         B5rOiZrhWYmsat1htn08HxNUy0EhEFy6ltyF4ptNT4FeVGpLhNGmLSWuyhssTDpKjHZb
         +HJJ7N26R06aNQZ8QiVG6apnIQpAwxpDCf+/JL9GnG5pAocEyJ4q16sjG+gz/FSNxRox
         NDOcmUt4P+Qu0PI2hl+g4Ty9wQPsTl74SPvjZbHPm4J8EtbWnMbywiXLqYj9XE2PBttu
         1gCg==
X-Forwarded-Encrypted: i=1; AJvYcCUEARBsm2PCS1N7uR+Y8uldt8zzgt9+sA9YiwuNSJe70YUXXFd55Z28PlgdxbDBg1RAZbL8qpmYlw90@vger.kernel.org
X-Gm-Message-State: AOJu0YyJtVjOHe4KWyZdZfBpfJps5tTQBLtSf7hb2AHI3OWkisP8YLq7
	MZ/TUS2+Bz1JCDtVCy9mBjAnlOVBBCJVFFMNshPkkoSsg7q58508oDLsU8MHxmEivbb6jT5R+Gs
	08XyDEbOmsn1S8/A3rE00KoHU2S805ZaTbXbX
X-Gm-Gg: ASbGncs4hL0DU/l0SPsTZ36V1MRwQNeBt7UtOnK/vHKk1VLlhbS6n4NOW0zgDxq7NS1
	iR6c0ri3g1wx9n4dbZvtfYsH1gML5jo+wCDMFnROSnIW3fmLbAJNflwY2YPO3XyzGAncZ6KGX
X-Google-Smtp-Source: AGHT+IE3N2cLiQ7+cf8WqSfpU/XsS4YJ3qwsjZ2stHnaJgNWkUogcNcG2SHfhhTQq6WriNXafqqvbkY1HHOKSZPy1fQ=
X-Received: by 2002:a05:622a:4287:b0:471:be43:a534 with SMTP id
 d75a77b69052e-471dc777033mr6796511cf.12.1739809702916; Mon, 17 Feb 2025
 08:28:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217171018.7b4f5e2e@canb.auug.org.au>
In-Reply-To: <20250217171018.7b4f5e2e@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 17 Feb 2025 08:28:11 -0800
X-Gm-Features: AWEUYZkmdEfemTZ21_DYBZC8hQT35KQVP-KXKmgcVnRAgnEGvAIvv-8AeqTVC28
Message-ID: <CAJuCfpEJO+pd8BUSCaa+qawnoKzFCT0+sDr3u3H4BGoqOn30mQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 10:10=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (htmldocs) produced
> these warnings:
>
> Documentation/core-api/refcount-vs-atomic.rst:90: WARNING: Title underlin=
e too short.
>
> case 2) - non-"Read/Modify/Write" (RMW) ops with release ordering
> ------------------------------------------- [docutils]
> Documentation/core-api/refcount-vs-atomic.rst:142: WARNING: Title underli=
ne too short.
>
> case 6) - increment-based RMW ops with acquire ordering that return a val=
ue
> ----------------------------------------------------- [docutils]
>
> Introduced by commit
>
>   03b412c8b184 ("refcount: provide ops for cases when object's memory can=
 be reused")

Fix is posted at
https://lore.kernel.org/all/20250217161645.3137927-1-surenb@google.com/
Thanks!

>
> --
> Cheers,
> Stephen Rothwell

