Return-Path: <linux-next+bounces-5840-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470EA661BD
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 23:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA4981898EBB
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 22:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421D71A2846;
	Mon, 17 Mar 2025 22:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dio6ggrp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C451CEAB2;
	Mon, 17 Mar 2025 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742250957; cv=none; b=NEDaWr4npIzEEvmRvajMAOWL9qq/iYSyyINN0Lw264blHZYO0Wv0go2FoRekPaUy/VCu5TdASXcnftaijXfcaWjPPMVHWFk/ywaeA6FhJuelyLs5bwlZAKuI9R3LUfvlmhb6HkQH4UAWFmeTLcwKKsXJ98dxsq/rzO23qdYscWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742250957; c=relaxed/simple;
	bh=Ij6YKGRj2cGSCiPlKr2SlgObVR65tIs7E0MDGRvAA9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mp9zZHZlI2PcOJTQoYbOouDEUmAta4xxiF/b3N5A111m/P0L2ZP8E7CIwDukDUaH5iOhEvs5Mn3XojcMR6x1RmNNMfwvCZv1EF/YE1Q9zwgSEB01TqhSLM185UqSCeQdz7EID6ivS2GPOZs2AeWq5A7VcQEG+hZXt3bPbFjEta4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dio6ggrp; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso522121a91.3;
        Mon, 17 Mar 2025 15:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742250953; x=1742855753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij6YKGRj2cGSCiPlKr2SlgObVR65tIs7E0MDGRvAA9k=;
        b=dio6ggrpcrc1ZpzrcvPfvkBFDd/ut0tIR8kv+QXssAQ8d4qicx6P5fJepvxBEW9RVm
         KMau4JYsvwrkucQnWSpKNZSzCnLVSOFX5vfq4pYZSYM+Ojl3v0gU0Ssa09qU9qVGxZTr
         nOLi+hynU20FC33rLE20V0M+RwcXfKeI5V+bb0MuvakLf3ihe97zrZqISHFPDIkBGiaj
         8S61tM34Yc3pLZn5ydfxdbiaNBSayYkJ9GtlR5VZleNMFiQW/FF5Yu70cnakXqVzRwuL
         Oh7GU40768173483xwqEVG37U5TIgVciLGZF157DJBmTrRO15TL1sym18q2z1Ob7xWfe
         3y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742250953; x=1742855753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ij6YKGRj2cGSCiPlKr2SlgObVR65tIs7E0MDGRvAA9k=;
        b=A6+aMmovBdw0IXKooxKn2GQv/zwsuDyy9MkwXidtkb0uWFvc+XVHjk28dTcjLqbdkA
         io3n2z2CJPSyw2MWt/VS+A70zKWAmfTmVHXsRZfbJyW4PgQGOnDiKi68vRBZLP8CsoVN
         xlfGeMLW9gIvT3ZE9q5wFrLIJVpJ4XjkZSiDEDLftCtzgzJVL5LhY8Hi7u5DxYgtyQiD
         qK3c4FCsNggloqh8yWG/Xyitb/srQOS+ttsgV7XNX00ReNMq6dbQsmqGi0sYby2pQcoM
         Nw2n4wZ7kEtHJEWRV6qHxhncF+T1Au+ZHp2/YI96HVWYqiOaiLLoDJ0hD54TU9PK8Hfu
         l69Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBoU3BWPQi5xbzCjTx2Lvr6BKDtBvI9p1yJaDt49QLwSTxcf4TqnaVxWOnasoajSI8PFVtWzuib62HH3I=@vger.kernel.org, AJvYcCWbbs3AJduA0h8addDpjiU2P3CO2S/r1qZCJEhSFwLBEhh/RKrcwSH1hQfvs7FroTcAP/hwLqWGS2nAhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7FNyUxYAK6dX1b/Ho+eQSzHe+i5E5bRhsea8LrthFK4uXHNb
	x0+1i1a6bDQiw0olbyaKxk1w5C9XAHSbpiRjAuO+HtNW2U2JmIt4sj0K1RRGCulHtbyHIv1xD+8
	40DFq6s9QZVh7Jt+iLhabhUTEUqQ=
X-Gm-Gg: ASbGncs0OGLIn+ZYONu6PxvmNTZhQZqXxbG/9nqEa2q5Fq5sp02sbWaeXfqZSLzbYSW
	ZwZpFeL3/d9L6Kw7ewyvFQuSYZtN9tKk53UPO/LqfMiAGOXPDU93zX5EBVB0miysD+Jr6dzwko2
	aJk1vWRIMU0XrGH1ugBOzKGPB3q6gVE2JCydsb
X-Google-Smtp-Source: AGHT+IFu+4auadLII7JnO+phrlGQ9LLasn/aO2EaG5l1ExsvsXtFn/K1edSyl5kDrJN2IDIUpepXmpNSQsG8PBkPK9E=
X-Received: by 2002:a17:90b:388e:b0:2fa:6055:17e7 with SMTP id
 98e67ed59e1d1-30151d8eb02mr6839035a91.8.1742250953008; Mon, 17 Mar 2025
 15:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317212047.46580935@canb.auug.org.au> <CANiq72nD2ezPVHH_mZhB4+FmD_Un90dGL+q5-Np+zUDj97UWCQ@mail.gmail.com>
 <20250318093123.22f584df@canb.auug.org.au>
In-Reply-To: <20250318093123.22f584df@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Mar 2025 23:35:40 +0100
X-Gm-Features: AQ5f1JrEM1qGBj93Al0V_DZZnl29x6mr82U6BPgUt5wFw4Q_eLg2-DarNtqkHxQ
Message-ID: <CANiq72kH9VqvhPyTxFh=_9Sbo_0ucnQbRMjN=FUshbNa6cUWHA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alban Kurti <kurti@invicto.ai>, 
	Benno Lossin <benno.lossin@proton.me>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 11:31=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> I did not receive your "last message" - or is it still on its way?

I was finishing a few build tests, just in case -- sending...

Cheers,
Miguel

