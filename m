Return-Path: <linux-next+bounces-6888-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67450ABF380
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 13:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABEA31BA4F64
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 11:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B982026460B;
	Wed, 21 May 2025 11:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U55hfG/b"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD93256C9F;
	Wed, 21 May 2025 11:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828582; cv=none; b=QbJo+9Il0AfX4DwjODt3cZAXd02KOjFhcduyZBS6FgNEi9hmcWH4+pAyyYmRJyDTcRLBUt4omEaItEcSMyRBxcP5G1sXH2TEd9uBhtpHRN5Fbx7E8siLuGjDcY6MsC9X7dnAdjb1Fp4t3NQR3/dMvWvEVO/f1FuGCCbcnm581LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828582; c=relaxed/simple;
	bh=qgC2ReSgX+YJE74CHWmec7duordV1tUdpja/WM3qppE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKawQvd1XfJanC8uTTQMzicuCIpq8BK+GXLn6zA+h5saHFhKrNlkcFU50sxKvnavLC+HSA4zp/Kr+Sn8a3obqhSnUhLwj8m+G2YfWKVN5R+VGn9kcUnWtzmayIIe2l2jE/oQZRmHagYCAxkj/7vq2WpS4Gu150ENU0Up80X+4Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U55hfG/b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C86C4CEE7;
	Wed, 21 May 2025 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747828582;
	bh=qgC2ReSgX+YJE74CHWmec7duordV1tUdpja/WM3qppE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U55hfG/bE5HTr5xSnaaLuZbn5xjqqQ8gAQoisi0yPkx+19NA+hhkExsAo8dTtGN1l
	 HdvOxEt1rVlnDwDtOy6z4wbHBuaqFakRLs4cYTeLxTeP0xhHHV7bB/hxLdW1kQ6/NI
	 i7LsKMi02IvCf/LDHFhorj7ZUuwPvxZlfvjE8o1pSrStOHrPcO78PS986v2oVBhD6j
	 zjl+BBUc7UT3F3PK5+osWEkUYlk0vmds3W22cr9Ww6egJfk3Q2Xv9rmjv/RvB/zY+S
	 Z+wbHxqG+OvNI2MDOb/UCjLYYEGHaPN674J0R8o2vrYKfxCQhDg3dcCOKceHqZk0mV
	 v6rLQ4gj6v/yQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad56e993ae9so633383766b.3;
        Wed, 21 May 2025 04:56:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSGQiPUE4PAVJd5I17K9kb9YGy3yryU/CKJ0NptFY2LGLh2iMVr3ulP0eTbkz0hK88ICy5HWluLFmKUzk=@vger.kernel.org, AJvYcCXDiiBMvfkdNjFiXs2e4MxCMDDBfaLLLpXpqTswpW8OsVSFFDL7EyHOyuTlHnrezHx31krKZnSkf894ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9He2fzfG4rTLzmG8AtpdLrEsK+dcdAw1ysZNbrWtidIAEhZTa
	kA6OytE9JjBVxQOxunAJGl746T/GZcZ9yGNVfegonYK/pAbuWy0J4w2qDaE045gGwJAMPiS5MQq
	fXxqKviG5lO8phV2RM32r4udHCr/85A==
X-Google-Smtp-Source: AGHT+IF59P7sVgRr6RishM0tXcKyGpQghYtIxLUT/9smIEsMlXBQmlY9yu5d7LE4hl7rH/kuUB+cLnNmcL2tJg8tLok=
X-Received: by 2002:a17:907:7ea3:b0:ad5:b18f:8898 with SMTP id
 a640c23a62f3a-ad5b18f8a63mr173313366b.30.1747828580661; Wed, 21 May 2025
 04:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521213910.303c8546@canb.auug.org.au>
In-Reply-To: <20250521213910.303c8546@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 May 2025 06:56:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKCQ=b7+ZtuKWncX1ROHipNjRzCCEWruEC0obNkiHREDg@mail.gmail.com>
X-Gm-Features: AX0GCFseBtwEcgMeb_HfMc0TrDp5gLRzEV1_MKNGGo9Ko1v-oNeXiUYZ3KwAs0I
Message-ID: <CAL_JsqKCQ=b7+ZtuKWncX1ROHipNjRzCCEWruEC0obNkiHREDg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm64 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 6:39=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commit
>
>   54b8070548c6 ("arm64: el2_setup.h: Make __init_el2_fgt labels consisten=
t, again")
>
> is missing a Signed-off-by from its author.

The error here actually is the author should be me. Will, can you fix that =
up?

Rob

