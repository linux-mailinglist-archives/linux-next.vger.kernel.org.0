Return-Path: <linux-next+bounces-5787-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6AA5F4FE
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 13:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD6087A38A2
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 12:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65D626771F;
	Thu, 13 Mar 2025 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfcC3idh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F018D2676F9;
	Thu, 13 Mar 2025 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741870511; cv=none; b=POb5qeqlfVXWSqYNWclQmaTSMbZodhnekgpOXNyruMo2gzePgMkkM6Wgrgw3D1DNR5FTdyJ9gTmc1b1ePGF317JRy5foBnITnUu8EsnR0nTC10pqE2dTrXoyX93+gaUQ1YowvzcYuaVxfq0nPEAm3YsyhiROrTVqjMSqr4Q/cAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741870511; c=relaxed/simple;
	bh=I08DPqXz9C0kRwBfoUlV+bl0+E5sRAUVG0ayvjkmNC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cflAisGL52dXWohYvfER2IvfCgThM8F8SvklBWFYzMUC97xZCH0u5pDDOi6l8Mmpne/oqm2NErs4iNT7d5N/kf2H9GFVZOIutr4w6P83QYoO0a00ZzNME0vwmfA7w3hyT89DEVqOzSC2ebYKtb3LUnq6IJX0f0WnZXNUokwPkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfcC3idh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so167247666b.3;
        Thu, 13 Mar 2025 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741870508; x=1742475308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2epp+0dhnj6yOPiVNoyNipf+4U/mIhEWmA8SQYc13+s=;
        b=PfcC3idh/yx8uyN0Jz7HPhBiXIbJuKbBKrxHFKcBL3fAQF970K9MCbHyKPnwxV56iw
         2qdIsG1zQP7WX89JQ8Xi18nhHiSS3IopHVc5NalwTEPSPO2EtEQl8SLLwqqaIbkAXnH7
         tstiqOCG48LE9P2zuiM2LEpsfLNTqGQK+1unj2gDwAw8+X4ywNj9xGDQ4A6uhA+LS8Qb
         6khMoO4shNbuEdD0DBNe204YpZMm0me10xuS9Ne/VkbPatabN2zqD+2SpKliG/WObaSe
         /EuqEVW1W8pUAvzy5pMCK1F6WPin655YCHeWlwb3nW8CHfLVUTj+8J/3+QVAK4YCVHxj
         OO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741870508; x=1742475308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2epp+0dhnj6yOPiVNoyNipf+4U/mIhEWmA8SQYc13+s=;
        b=wKonXXfHVwYQ0YPiPi1J4DZsbTqOtixGFDOocgsD5Leh5uvQHpqrv0AoPJ4Z3O8VJB
         iBsuO2jrvR2LruaPcAHFgnSlOwt2rWGx5AF7qU0/4JLB7pTkBMXPXSMej6xAMk3PrRsj
         mmD7y1mOkAF3B5htA6EIZXZ1JOUTvFTvA2eM/MnzjTahsdKHt2I9IRUTJESOkotUes+f
         uRkhLFEwyKQLKfjclCmFcMXkiHEmZiSsfnhn80FFdkjlexL46ZSCVgLd9HK9B7XpuMr/
         fx9AkMHHZgfhqrcv8RNaZCCdWK15oY3WSnqll9d6+E5EsQK3wpBQfCPu7J55cY0ak6MB
         OS1w==
X-Forwarded-Encrypted: i=1; AJvYcCWN4NQRnaysljsDd82F8usSOpz8eWPE5MwEKcJjAamInpH0BVFypXC8rNUO2x+kG1cWAZDPvChBT3H4zQ==@vger.kernel.org, AJvYcCWhF4colVeYWpuylFcz0BPnZDpn7A9FY8waGWrH7bVGgNtwV5oi4M18VRTuQnBJnxkqjRxLh4Z3hP/qaQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYCh6vUzbRjkO/vPr3ajO4LzFQcluYQaq0r/hzCUOrcOe/00S
	Awkilwyg9mg5gRLK06cQhVxQ/nLNzjuFq1Gywg0ZKP2mXO7BF+hIr8xmbeYlz+h4Zg6ZElJrsXE
	xoMpKO1ie0h+sgMv7AZk7eIkb8WZyYsex
X-Gm-Gg: ASbGncu0VdOXSCcnAmeDOMiN6i89Yv1K1jSFKRQcpe+Eh0YYMdGhw2Zw6nGZJ4i1qMF
	a24UxIkrqIA7AI5iqJff1nrZtnhd0CPgOh40Iotv4+dspXeGBtemJt7ekPHHMYwWYe80HJmFKzQ
	KlXlUUIsM36CbLqv+ZTRTof9KX0A==
X-Google-Smtp-Source: AGHT+IEwF/5/fCzRzK3fZF+4uBM0fC+Y7KVKad7kYgTZ0anocHqS10aTSR2nkQJq0nDF2sIXQDHwStBa3w15Ef+wh+c=
X-Received: by 2002:a17:907:608f:b0:ac3:978:c4d3 with SMTP id
 a640c23a62f3a-ac30978caa9mr392353266b.11.1741870507820; Thu, 13 Mar 2025
 05:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313115026.364a8147@canb.auug.org.au>
In-Reply-To: <20250313115026.364a8147@canb.auug.org.au>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 13 Mar 2025 13:54:56 +0100
X-Gm-Features: AQ5f1JrRFpbPMKjqA8vmxUvM7xGTm7807QzeNYl5qafQfC-pul3fKei341vq-PY
Message-ID: <CAOQ4uxgoZ=1jSTZTWetPRfQiaiGAy=gj9cTjxCAfd8qeP+zwRw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the ext3 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 1:50=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commits
>
>   c27bb2f1343c ("Revert "fanotify: disable readahead if we have pre-conte=
nt watches"")
>   4fea134e1712 ("Revert "mm: don't allow huge faults for files with pre c=
ontent watches"")
>   e28a4bdddc53 ("Revert "xfs: add pre-content fsnotify hook for DAX fault=
s"")
>   df4447e2b3ef ("Revert "ext4: add pre-content fsnotify hook for DAX faul=
ts"")
>
> are missing a Signed-off-by from their author.
>
> Reverts are commits as well, so need reasonable commit messages and SoBs.

oops forgot to sign the reverts.
Jan, please re-author and add a commit message or add my S-O-B

Thanks,
Amir.

