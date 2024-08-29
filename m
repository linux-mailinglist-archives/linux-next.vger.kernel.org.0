Return-Path: <linux-next+bounces-3487-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87330963698
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 02:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3085E1F24CB7
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 00:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC5136B;
	Thu, 29 Aug 2024 00:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnkiN5Qb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1888360;
	Thu, 29 Aug 2024 00:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724889894; cv=none; b=o/z8idRYXWBuOOb6Ms/jZ7bj8iFymmuXo4W4V2qRSo7+egwnX2vV0VnBHpRLK7lJOi7LGj4cM5WZ/nAgL+ocXujcqNSIcVoiQgCWk6RP+LIDo/IMYSnXH47hG8oLcpHwP7t1EploUwFgu3FYRO5OQ3TUfX8zFZdviK5ntMmsIh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724889894; c=relaxed/simple;
	bh=MRFonQxmYhJJ82QrGbwbzGaDqwxPQGtHXmAKh7sBcAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iig1jIom8g/gZueIqPITsXbq58PVdaYzDt1uOSyMgW/B1OlQmUnNP1XVH3Fr3xI5G9nbGRJ3Jtz5SQ7Gcey5MJZQIYFHZAQ0CfASjma4IVFVFQ9ehfs+4jUvbAvSmVphoDTfJd4QpUKutVsQ8ENWC3I75Q0Kl29yANIZ7/5+4Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnkiN5Qb; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-39f392161e4so45465ab.3;
        Wed, 28 Aug 2024 17:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724889892; x=1725494692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0puyLk2fC3jdRUOWy/+GoVNt1lrnk3IGUR58dM31OdY=;
        b=UnkiN5QbP1rvvZE/aKYWvh2UUGjFQxKTAWm7OhmC7CNUIXqTdR0f83sJ8pA99ujBXw
         EeGrluepyyCcdJJ43R5v2KC20QfP+yrvmcC1GB37SjXwOiUVfoDOK96Kc78LZt0gP1p7
         yRXg4o/pAfQmNzSZuESyrXohyjoOz/IC71s2n8tzD5VRyKsRtfjnFEo6k159EekaWEq+
         Y+C49rE+LFSY9LOfcpyUhMz8DyTouqoYCn3raTwkc6okT7/j9uhLfSk1lN53XQmOjbwH
         NGo+g0gmwgN5cWInYznNlRP15BDOD20MWaMTULT89PjzSw7dj1wJ4VKovhSJZ7SBcgwW
         gc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724889892; x=1725494692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0puyLk2fC3jdRUOWy/+GoVNt1lrnk3IGUR58dM31OdY=;
        b=bFr55Nm5mfI9jnBUmz5QgsFEmwwOBtE2esitibuXH/MlkZ1FWgz6ajYH9G4WIM4KuN
         vNiR/A3jjIAiegHMIYXFESDk2q0rgtTOEQypS52j1aaDXzaeEDWl9Z+7ruX8Iucx124Z
         ImT3XU2spjrCCqv25yoNink/Z8UrofRU5girCMCXaWWJDP7GplTnexudRMUuGm1hMJOi
         NGBbdDR2G2lJtY19w16I7bm+/6YHzZ7nyQWZgC2TZUTfYBoGoOtuUOMxQ5ahLyJpnl+J
         OP9WVd1Yjnvm00SKQc5gEw1m33ReO1KkCrkiss21O+SIlmPYB3No9OA5gsyc7VqPTS7Y
         Ufnw==
X-Forwarded-Encrypted: i=1; AJvYcCUx9Yeu5vtgtQK5Jz+G8nIuqNg91Chg7QsMHvTwV93PLfM7OcfYTKgbqsDZV6upgtYhgeKKDu8GrBDjoA==@vger.kernel.org, AJvYcCWDQCEHgmrcxty/KCZg8QRJMzI633X7gh0c2SBEYCdrWbLaMLujiaTbJc9H7K4qs+Rb+8qtiEcW6hoTiQY=@vger.kernel.org, AJvYcCXn871GSn6AgbJ3aBhKpOJMemAlc0zvflbOOOh2MmiNM6hKE/xvk/4+lJCglW3sDJPtMflyEwzN@vger.kernel.org
X-Gm-Message-State: AOJu0YydQQwRSwOTznDgjTQ0A/TNb32rI56FX13qgrEz0nuSmw8b2Tbz
	GFh9rpgtt5dzVJMmQW5lJ2ySpGxIhet7fn4MH2WNQUSZEj8QLDHVxmiBZkDzeCq2GypPAUAmhQQ
	3UiK3503vFu3v6k8PCLkJ6wz+SEg=
X-Google-Smtp-Source: AGHT+IEi6gplz1xj/ti3S0THGlEG7wCQMIb6NGrWkuk6okIGWW/QrkVm3Rqons03Gq3TibIgYbBIXDAzmnycpDF7xlM=
X-Received: by 2002:a05:6e02:188e:b0:399:4535:b66e with SMTP id
 e9e14a558f8ab-39f377e08bdmr15717525ab.9.1724889892016; Wed, 28 Aug 2024
 17:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828112207.5c199d41@canb.auug.org.au>
In-Reply-To: <20240828112207.5c199d41@canb.auug.org.au>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 29 Aug 2024 08:04:16 +0800
Message-ID: <CAL+tcoC0Wh5uREYs48Oq7yyKjChbY895NTr8CuSf+2BVWToaTA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jason Xing <kernelxing@tencent.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Xueming Feng <kuro@kuroa.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Wed, Aug 28, 2024 at 9:22=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   net/ipv4/tcp.c
>
> between commit:
>
>   bac76cf89816 ("tcp: fix forever orphan socket caused by tcp_abort")
>
> from the net tree and commit:
>
>   edefba66d929 ("tcp: rstreason: introduce SK_RST_REASON_TCP_STATE for ac=
tive reset")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Thanks for handling this. I noticed that the moment Xueming proposed the pa=
tch.

> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc net/ipv4/tcp.c
> index 831a18dc7aa6,8514257f4ecd..000000000000
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@@ -4653,10 -4649,12 +4656,10 @@@ int tcp_abort(struct sock *sk, int err
>         local_bh_disable();
>         bh_lock_sock(sk);
>
>  -      if (!sock_flag(sk, SOCK_DEAD)) {
>  -              if (tcp_need_reset(sk->sk_state))
>  -                      tcp_send_active_reset(sk, GFP_ATOMIC,
>  -                                            SK_RST_REASON_TCP_STATE);
>  -              tcp_done_with_error(sk, err);
>  -      }
>  +      if (tcp_need_reset(sk->sk_state))
>  +              tcp_send_active_reset(sk, GFP_ATOMIC,
> -                                     SK_RST_REASON_NOT_SPECIFIED);
> ++                                    SK_RST_REASON_TCP_STATE);

"++"?

Thanks. The change of reset reason looks good to me :)

>  +      tcp_done_with_error(sk, err);
>
>         bh_unlock_sock(sk);
>         local_bh_enable();

