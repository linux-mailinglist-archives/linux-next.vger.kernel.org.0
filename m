Return-Path: <linux-next+bounces-8458-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64CB97554
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 21:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D04827B507E
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 19:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523642BE058;
	Tue, 23 Sep 2025 19:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmtRJBrJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5A1DF72C
	for <linux-next@vger.kernel.org>; Tue, 23 Sep 2025 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655558; cv=none; b=adrc3uORQ8a0ytOiIDH6Sk6WrUIpTADDQPD6ftHP6vtz6td6sE2HrYSQzCCSQAjVQhUK/OyJDaVuswGzOrCKBpeWG0BYlYHn06ymuRfy9TkDfgeeukbIw3sy0eiFF2HNOlAxEttYOmgRbVnN7dSxWWSYvAl9SKDXSLIv2gXetto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655558; c=relaxed/simple;
	bh=QGET12w7i7XBXFuWL5bz1REoMzgUFbmhweQM9vETKkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0G2NYyJUnpnjdxXJM1ebhdrJ1oy4rEqnJdzUkM1Idt2rnhqjrbbJm8PJpj7RQkmB9VzlQU6wffOVRTaH2G6u5ZZK9Wcl3x0bwg4bX1nkPiwBqSk3H6/rLkL3EGI/aSCh8JHdpTqVuuofOEYnIFbL9TMq9yBQ8KZeroJkxfmxyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmtRJBrJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24602f6d8b6so8892295ad.1
        for <linux-next@vger.kernel.org>; Tue, 23 Sep 2025 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655556; x=1759260356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGET12w7i7XBXFuWL5bz1REoMzgUFbmhweQM9vETKkg=;
        b=KmtRJBrJakIBXOLn+UIbJrOdHTsWTwtNabIHYCdLOJ0ZCkIauU75OEey6s3cqJkwvS
         6fwziCPj7Lb0I3LmjZiyxf8hrXCrY4FAQklLGDabbwQXnH+rSYjwn9usTsOAUOtBJ53Z
         lnLzukQcG9geDjl0XUvhwS0xgFlzOq6V2oAXeIwM57CVBoqnal7h0tWRf2xEBXw55NV0
         SWFGAGHXj0CZTWmHaSaf4cnzDnmiQjv4kofQz0A6T1pfk2nYLtbLsMINplDarwL9WSXK
         meSrUSsHXV+Lv3znqIq1kf/mFu3cgiGhSlOb5WDieBK3CerOBCQznHV8tPhVeeQ06vop
         dtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655556; x=1759260356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGET12w7i7XBXFuWL5bz1REoMzgUFbmhweQM9vETKkg=;
        b=Gm3+fA3juDPoHSDMX/KzIKg/yoXxaQGxWLMn1+rLhopUsriKXmq3gcGp9g1f3k7FQI
         Wy8LWCvdPQQLNZXXz1Oj6zqThtiMZZTuRFFShbebLztv0jiM9XIRMR1G0oNcLaeEkTM9
         NRPpfP/J+yqYXq3rPpyXBwthnmlj3QpY12qS5NZ2komCNJHLKpN2pm16nQ3UF4WO3uGo
         FooSr8xZJkbwupZ/igPvV6lpj8ffluejzYEd2I2wSjgOS0YRI/XoFwHGBio6WGsAmbFi
         Dvm37R9plOSqPYspvir9Er/W029tr6/aPl0o/tuA0w6NlRxa3BlZjgh4zMDZC19dcI1y
         cujw==
X-Forwarded-Encrypted: i=1; AJvYcCUw1FrtS3U7a6wBu6pWXMz/gdoKSM62XMqNK5zYd/HVt/RgWdwJdpZvzMMf3m4GMgm8+O+1KPAKw+33@vger.kernel.org
X-Gm-Message-State: AOJu0YydjequQYBaepQO0+a/MZyNq4XJ4tB33jP5GpvJJWphBobxeLQN
	rJZ/LQyJyoCKeOCD/cu5AaOmWZ0uNmPUxEfdVg4mH0rzPX9rcijwLA/oXIHujybJIfgvNPWtde4
	PfF7iuZU9yVcOOK/vHQUA5RTXQPBz5o0=
X-Gm-Gg: ASbGncuC4qCp6LiMjQycHiJj/7E94KOpPJsUtbA/p6N6G3Tkvr9iYLcalqkp8S6ibUN
	+fn6mfdKEugthj1fbGR8/QMilTDSy1fbaClDHNs6C4/HnLJD2RlpmZ7W1YR5ronhmBPVEbwQ2CG
	Hw0HHDc3g/jjvRjN/cXMrbqKpzHG8q2Sz7+cvjXl6z+ZeJgjgdVwQkxpT5pBbLLaNS8gIbfN3p4
	kVMV/2AYfGPjsp06Nrpei2+yKCgYE7Abi7lgjDpXg746Z7rdm8HHCivA1a9dbBAdocGMFxDdZHr
	8ls3jWsl2NZEVpbx0hpBGW2YEg==
X-Google-Smtp-Source: AGHT+IFSy0WlT1BAg3zYZsjD89CR/U6IXs4byyc/pkJyLwnuJ2ru8QRjSH9bFey8/JiECgwWevhMZ/QPBA5zdVq04MM=
X-Received: by 2002:a17:902:d48f:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-27cbb8b9fd0mr27378145ad.0.1758655556180; Tue, 23 Sep 2025
 12:25:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNLN45NdHatkNUwg@finisterre.sirena.org.uk>
In-Reply-To: <aNLN45NdHatkNUwg@finisterre.sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Sep 2025 21:25:43 +0200
X-Gm-Features: AS18NWAEfe2HZAxb-xCThTaab7MFGromeGwGjopKxtKyCzeBQ3znIF3ZNmm9Vr8
Message-ID: <CANiq72kv0auCd_ZDgpyC-JYY1+s=DUwJ6NYt_XTCnKdZQ2vCmg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the drm-nova tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 6:42=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good from inspection -- I will confirm in my CI runs.

Thanks!

Cheers,
Miguel

