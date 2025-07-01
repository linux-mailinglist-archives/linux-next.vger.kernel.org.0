Return-Path: <linux-next+bounces-7293-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0CFAEF2E7
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 11:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 950121883CA7
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 09:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723DE27281E;
	Tue,  1 Jul 2025 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwMPU35H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE933272811;
	Tue,  1 Jul 2025 09:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361150; cv=none; b=XPbWLUgSvydOOFyUfqD36cd7+IFjM7g4KU8Eyxeh6nd4qqL1TJHlfODvuVpDHK3YWD9hC5iJsi6ByQ5uPwcD3qhMDSqfSNtTtba9acD8e4G9RSLN73d6JU3NH3N1MU6S6gi6qH643Akwi3yHjx3HtebAKCVOCoDlZCZEkOUp5AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361150; c=relaxed/simple;
	bh=L3TkFh0fwtVYaiYBZgOnZ5611hF2Olg5vpNbzrcso8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRu9a/rleccN/Mpo0Qbsz5oSd8adfo302B8DIAAS1R4W2WIoYEyqKZ1PRZ0CbKKms0ZLsMKL5AEPwPZiEZLrllFploCur1iqu3+gQTmDjqqsjaMmqWL0Pb11qanPSIQmVe1jDuw0bjKNiDrPLNx5gGFzsQf+4oWv7VZ4ZpVJgyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwMPU35H; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2fb9eb54d6so978658a12.0;
        Tue, 01 Jul 2025 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751361148; x=1751965948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4McNG5+rD7Nm3TTw+MBbkRpB0msiB4Rq5QefUUcvjus=;
        b=jwMPU35HNc3+mxnldO3ovDro+5fKSiEKdAelWR1KSRh0YinZl+A3RnezyzBDgpBZA4
         9G3/Cpz+jLLyzvkaD557zuNlEkM/vx764/9ATnpaAhclyfYiqL2MxxMg/lJg1ORS4IPs
         oNIVzpqBl7ZVSPWXF5TsekyCd3SNrQnAsQhb2oQ4EVsiUo+sGcy17NOKXzr9d0TmTrzS
         1e/udKXh3V6aLBMp04vb56KO3wVlJb+FYb/2b8yYzgf39DqcukkH7sqGxmtWtUsf22PV
         cPDMcaPo+7LJ/Zvoo81pbWPXVhkEnEFRrZhId+Zou00TMAxLTI5VTLcODwgD6fCfJbjH
         TWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361148; x=1751965948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4McNG5+rD7Nm3TTw+MBbkRpB0msiB4Rq5QefUUcvjus=;
        b=TodlTszCyigPOq3RSL3a51tXBS4GwhiPo1top4KNOs5xoDoO9FY/P7AnKB58Ww+v4V
         XdjuSptqd0fh/g0m3nbCEr0IeTv6F8CVJeaVwTebv4lAjggkA1W9+SLN8cyKHuWRU4Bs
         7vqyH6WwG9c4F52vwXRsS0oyOwkt0Ur6qSH6hWEWIu18OB0r8/NLojG2o9KDWijVP/gC
         vWoaUkOHqlq0ww5LMT9ejxLYvD+zlJjcKoAQJa2eRbeGios4W5BUjG9t5JI1Gml3NauY
         jONL6Gf2vRWSCiQPy36vqOIypJLoMGOspcNgvRaTDb5d6O5B7u9F/otnV4rt5dh1ooHz
         tBEA==
X-Forwarded-Encrypted: i=1; AJvYcCVOKXQV0KF9ChG4Nemv8YxRJkFiY3P5PzUlIo1GQsFiZO0QT/DJI1uj1PgnTatP44vA+7UiFKEjmIR/O6Y=@vger.kernel.org, AJvYcCXEyBiMRcLMVJu/4Tc2Smv4ae7SkNo7OxlvmrKn2pMZrF+S+9qTL6AbHjb9lCJeIpBMIgobBKYF6UxjTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8gE+9q+VdOvtSWTC8C8E10hJ/2U8J/6K3y5hrN+pXVIaQyvC8
	8OkW6ssfyHCcoVnx57SUwNScsuA5lexAmzPyX4hwWjlIOSbou35iLN14sQQKs2B14tAQp5ODFOZ
	EqvaW1qU4UZauveX++7D9MjoLYdCxsOQ=
X-Gm-Gg: ASbGncsPid5B0o/ci3kAP1nNUZTgRyDuqsqD7CLCJMvS1vZczzc40w2ajgutkPYAXdm
	nHiLwqw9+Uq7G3DsjJcEfWU9cGlEFrLDV6ZLTK7q3BGQh3A/2wwowEhw4ak0KW5usw065gRdzQV
	pjmZbtMK2Mni/Hkqq1N2fAoXbXqcEVqyL/QD5q+5lBQOg=
X-Google-Smtp-Source: AGHT+IFHwc4aBB/geds7Zk2EL8s0osfafdk5fSerpaLH48AbaG2bIa6exYRIWXhtcEiAoe9pbx4mL8dvwCPXd//4Glk=
X-Received: by 2002:a17:90b:3512:b0:311:a314:c2c9 with SMTP id
 98e67ed59e1d1-31a800bba14mr1233708a91.1.1751361148131; Tue, 01 Jul 2025
 02:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701174606.7b07bbce@canb.auug.org.au>
In-Reply-To: <20250701174606.7b07bbce@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Jul 2025 11:12:16 +0200
X-Gm-Features: Ac12FXz_6ixlTRUbdR1kdEBVEfrlttOJGOE5C2TZU9P3vGyzxnH2eGGNVWk2WMA
Message-ID: <CANiq72mSELMEopwaRvxjSn-t1-9+uDm23_rFscuKSRR15LK1vQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 9:46=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Maybe not all the above commits are involved ...
>
> I used the former version (since it changed things so much) and then
> added the changes from the latter by hand where I could.  I ended up
> with the below diff compared to te HEAD before the merge.

Sounds reasonable -- I did a quick merge of just rust-next into
driver-core and I saw a few conflicts, yeah.

The diff seems OK, but I can take a better look when the tag is out.

Thanks!

Cheers,
Miguel

