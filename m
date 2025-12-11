Return-Path: <linux-next+bounces-9387-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEF7CB4549
	for <lists+linux-next@lfdr.de>; Thu, 11 Dec 2025 01:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53BC8301471A
	for <lists+linux-next@lfdr.de>; Thu, 11 Dec 2025 00:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44380228C9D;
	Thu, 11 Dec 2025 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl00nkEu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9D1DE3B5
	for <linux-next@vger.kernel.org>; Thu, 11 Dec 2025 00:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765411329; cv=none; b=UxioIIvNxWdPFYBoegAoRBDN+WMuv8VoOFC9lq9u3q43ZrpFjxyGuEyfz2J4asJoruRTFxzhIKQ5FyXHtoaFpD0nmKIjMXk6KRflbfrCNH0T1LF4+m9bu29q5++g0VIrU08DGgxNIdpQEDUrpS/agawF1tJE1II5d0/RTGCnMls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765411329; c=relaxed/simple;
	bh=bJjjD6vHH/uYB2rzcGMM3YAieoRHeBH+mU+v+voJGvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kY7nh4seCLTq+KymOXfI5sl7pJ8ifg/nIbbmmpGrnRoDgQuvO9RHdkmMME1pEhn2ttmqRfpCKF5awlhv7PyluEQXwbcyhWbeA2f40yWt8ct3d/AJ0LF2NY0I/93XxgY591iWJctX/XBZPOiS/bdLRpHvEm2YoiN5fpn1gA+dyPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl00nkEu; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4557f0e5e60so257661b6e.3
        for <linux-next@vger.kernel.org>; Wed, 10 Dec 2025 16:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765411325; x=1766016125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZQTeoocW/PFnD+ewKXir0vjzWenslpRup9U3tl/gyE=;
        b=cl00nkEutnWLJOAsbxtbQtior32cc+z7TGrBnwDH38eJ9lX1S++GI81u8OUkPajZbD
         JGkeIZE9VQjg+TPMV1dGJu/vKGNyhREtKAzMGrOF+/m7nE1XbCO6dkQWk8DFXxNclNPr
         Pfq5akaCyEsEmqpPp2PgT8A5hmUVXsImhBT2wCJnxMeKWOcW+Y4meebCKAemHDKkeuHK
         cSbCKyWqejUoNionHXh8vdbw5QsvRSnXRb/OJ16kqrL0JKnTqeR89OIJ/30oThdU0Bwm
         iRrA16Pd0okxxGolyPcFHk4LgBaVh5oUO8/n0rFDT7CjHwY1IjAGqlKp1Pv6rOw7LLxo
         CdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765411325; x=1766016125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TZQTeoocW/PFnD+ewKXir0vjzWenslpRup9U3tl/gyE=;
        b=Z27hNizKcTZfUVSh2zq0dSLS8NOktj3ME47ktwFEPoHviE458Sh78coLOQ7nwK0uMP
         sO0aSRkJVDX2o0MUAmWkGSKcOaH0iiEtvZz14/xqRozVBT6bN97t66FsYIlwB1Mz/3C7
         pLm2hHZbhI0rB2zkYIqF+wMENGAc3yoKsrdZb7/TPi9LCfNjhccU/oOr/YoXjMeOAq69
         l0LNUN6LvrnoxKxrovJqmc3Of4fkWsuS6FJzMEHHwIGUHpFBH0LGRTDQ7kFxNXnHijsw
         ONRiyFcC/9BdrCXf3VFId/34Y1Rk/iC0zdrpwMFg1Rtr6wDd7wR6Sp5dBEMiRRr0gqAS
         JLJg==
X-Forwarded-Encrypted: i=1; AJvYcCVMLrHgCCGLxNP/dlJpAc/Ao6yA9FcZdbAE+xTKJnbYkcmNfdOr6Npc2PzWXy5IWyDiS536VnEZ2B1r@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv9bzpWCbGgKtVOLskg+CVTUuee7AButQtGdIBjaKjAjE98Uvn
	mKvYqU3xk96AWYbmKXnmOBDySeZ2Z6lfhaGpXxVjxo2dgOaZmVXbJQeT1QQd48FIi3qN6AEgMnu
	EXJPdYdgNMwp1gkB8aCh8T2KhG/Z7Fuk=
X-Gm-Gg: ASbGncve18FTABku7mMAI7gRXGHuaorsmmv5GENLNDGJAgpuBBvWjEHJ0QXsPaXXh6N
	AWqoZsT/MMLGQNGKuw5H+JbLDMsZGGXQcgwkp6wuoPTWXtgMbo+o5sEqX4HAj8dL5LEQukWBj8B
	bGrsTeBMe9HjxGuPT1nesQn4JAAYs5jAGL0py4rZGBowzQvA3eG8867nmaExv1hDch4n6+jsgGa
	4GXOINSNgnM4S7AbJfXDAx0AtYupEXwhO9Ix90bXPRcrfC7bqFpY4y3KWue0YDwV8BO5i4x
X-Google-Smtp-Source: AGHT+IHq6Tfo45Y5dLik4BnVc8smu9H2dClhY3e61Ohdqryxj0phj3Qq9kqsYzyFp1Zt/uZkGl13H+W4JA1qbtUMcUM=
X-Received: by 2002:a05:6808:3093:b0:44f:e61d:1893 with SMTP id
 5614622812f47-45586944368mr2201306b6e.63.1765411325412; Wed, 10 Dec 2025
 16:02:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211104903.24a16b29@canb.auug.org.au>
In-Reply-To: <20251211104903.24a16b29@canb.auug.org.au>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 10 Dec 2025 18:01:54 -0600
X-Gm-Features: AQt7F2ouuflzFrpSqIxa_R_g4Qe9BmzDWfhG_FeT5_DFrYKXTQ_44R-Hh7NOMtg
Message-ID: <CABb+yY0FJnunhxmapSXqZ=R_XeLOZkjUZLCRyt9s1zDhzFR7Hw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mailbox tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 5:49=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the mailbox tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c: In function 'mdp_pr=
obe':
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:311:41: error: impli=
cit declaration of function 'cmdq_get_shift_pa' [-Wimplicit-function-declar=
ation]
>   311 |                 mdp->cmdq_shift_pa[i] =3D cmdq_get_shift_pa(mdp->=
cmdq_clt[i]->chan);
>       |                                         ^~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   e1fe978a07c7 ("mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()")
>
Jason, isn't your "Remove shift_pa from CMDQ jump functions" patchset
picked already?
Ideally this patch should have gone in that patchset. But if that pr
will be merged soon, maybe I can hold off mine. Otherwise, I will drop
this patch.

thanks
-Jassi

