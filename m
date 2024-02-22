Return-Path: <linux-next+bounces-1288-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CC85F5E8
	for <lists+linux-next@lfdr.de>; Thu, 22 Feb 2024 11:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 238192821C4
	for <lists+linux-next@lfdr.de>; Thu, 22 Feb 2024 10:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ECF3E49E;
	Thu, 22 Feb 2024 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dsl+0PXl"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8426F3D54D
	for <linux-next@vger.kernel.org>; Thu, 22 Feb 2024 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708598539; cv=none; b=QAz5LOccTvYol44omFnPzcV08xSq9YjeJm2H8fDCkxI547J3QLTnPI0mmot8sHgvMrqku40txr5ZgsJE61j1BcJqOMRWtnjqXi+ckVvWDfJ+XmmTqNhG1r1jz/9HaY+tAYecVKlD/ZYexvT65XxC6LMGMAmOpSDdepZBDvX10bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708598539; c=relaxed/simple;
	bh=Wr5ytHS/LMlDWoRnSdVRq/OpKXEKN1tbEGP4/UioQ8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVvC3bNWconA+qqBOyHSu6c0y0B3MgvHepqndUshJDnctTNSldjwdI0hTRdj6HxJbVl9VHxEHaf3qkBE71rnirUEgWi7Blnf3CktfjQRlQd/f6eBupmTw1ZLz36irOrVnMQd+RdovTYwE/prus5jSl+Fz6vU/VCeLOJuqKnrc7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dsl+0PXl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708598536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVi5xtqagqhQr4yQkZ21VVqriPXn5rhJhhfioOmJJms=;
	b=dsl+0PXl7xUQ+poY/ZuamV1NQgy3wUnIGhUtwp2xHAfyeLLR2OMkOoRU83G67kHo8BAQ3r
	CdXjMkgiFRKG/+a1D2ISYVCQhmWR1nhDs9Ye+Pbzxi1/TaIA2SOrTtT4bgET0nJMEVcIkr
	VU0tpT1U2eunmrso3SOIgXQZVYiYgzE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-iKqUhLlmMPuXHLy3iPtBEw-1; Thu, 22 Feb 2024 05:42:15 -0500
X-MC-Unique: iKqUhLlmMPuXHLy3iPtBEw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33d5e12bbbdso1868685f8f.1
        for <linux-next@vger.kernel.org>; Thu, 22 Feb 2024 02:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708598533; x=1709203333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVi5xtqagqhQr4yQkZ21VVqriPXn5rhJhhfioOmJJms=;
        b=R2S6PIP3svkTIBRR0nJicbgHdAmUatv7uhqGs7SNI3UUGeuvzJeePPzJ+6XIsOuok1
         JsM0kpP/pe25/Y4DzugyjcdrIiiEAXjVy5lZ0JUgbtkJQk/Fy94fvqeLxXES0b4GcFO0
         77efuKG8PUcj4/or0JGDfjObQ/3vVv67bgJn0XoRblqqmj6CEArlzmG2hx3FygCuBnaB
         Dh5q+DxU8H6M8HpLhZogCr+mmuDyi88mBKPHJTas7ROl5wIhjLRpkocS/BMnbHHQfQHz
         XRnnYl79eF1hH0PAN48aGSwbHIMwYaGvzzFtFGQr/egYmBBDE6NMic9tpGkYkn93TEka
         qkeA==
X-Forwarded-Encrypted: i=1; AJvYcCXMnt1jgQVc05Ti6Uf1LYpUCnpTgq/LY5nBgT4wUFUDHd6YPdxl1tJC78NKr6/F5eaZmJ93wSL6rwe2D4VCrBN2wog/ZIZTHJHqOg==
X-Gm-Message-State: AOJu0Yxx2KsgbN3GQsx2Q7l0T3uC9NkBG08e7bT59GS/wyrsQXHziHJ1
	ZdXrDZAQ/O6Hzo8Ph7rpUM8KQgkmWut3yBAVl7OttQaFdXKvS4rMioL3oiEH9IrztClcDNmjh0g
	o0Iw+xSIQ8pkfS8l8MM8uHiLWQ9yWyLxRuckWV8vLsY71BQRrXLN34pqOTO753AqMSoafOGyW2m
	HG7uVf1FNIHMjAS0oMTShRdVlvac6XMZQTbEfz/6zAxA==
X-Received: by 2002:a5d:4850:0:b0:33d:391b:8db2 with SMTP id n16-20020a5d4850000000b0033d391b8db2mr9472705wrs.61.1708598533682;
        Thu, 22 Feb 2024 02:42:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt816+aUtSBUADBI4CYXrHxRHYjhYyzfPh3WwqLeFMhlmXg2tNA3B2shw4FqT67BiVbto4PUojvsiihkGZ5Sc=
X-Received: by 2002:a5d:4850:0:b0:33d:391b:8db2 with SMTP id
 n16-20020a5d4850000000b0033d391b8db2mr9472691wrs.61.1708598533378; Thu, 22
 Feb 2024 02:42:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222145842.1714b195@canb.auug.org.au>
In-Reply-To: <20240222145842.1714b195@canb.auug.org.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Feb 2024 11:42:01 +0100
Message-ID: <CABgObfaDQMxj9CZBzea+=1fcFQXEemAJoH5Jvc9+tfiC7NAvrQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm tree with the drm-xe tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	DRM XE List <intel-xe@lists.freedesktop.org>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 4:58=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the kvm tree got a conflict in:
>
>   include/linux/bits.h
>
> between commits:
>
>   b77cb9640f1f ("bits: introduce fixed-type genmasks")
>   34b80df456ca ("bits: Introduce fixed-type BIT")
>
> from the drm-xe tree and commit:
>
>   3c7a8e190bc5 ("uapi: introduce uapi-friendly macros for GENMASK")
>
> from the kvm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Lucas, Oded, Thomas,

do you have a topic branch that I can merge?

Paolo


