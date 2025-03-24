Return-Path: <linux-next+bounces-5986-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60997A6E621
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 23:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDE6175EA8
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 22:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71A41EB5F4;
	Mon, 24 Mar 2025 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwfkiynV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E528F1EB199;
	Mon, 24 Mar 2025 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742853624; cv=none; b=d7RCbBfxtw8uJj5IYx0zElNplwKewfbyBomIY5tdgFLFrcPibDcsIzohi/fsQMkDnVmgmpk2NBtRVKaiEw8szEWc7a3UXuZvPb/XrMr6V73x+HrmgESqtqpg3F3xJNePTg0xggMLSxQ51FGAMB98quzIx53BAyoOW4XFdPe3xTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742853624; c=relaxed/simple;
	bh=PtpzQPV91DRAINKIpL1SiRX65+cy10ZmPzRxJQEHIlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZDlJZ3X29SmahxsvmyeZGkPW6OncfHw73jUyKufgtM56FoODSxX9yMr16m+jLWm7UgzR0kMGNkrELhDWGLr9pUNYWDF6CV8/xbPGZ8caqjcOkHcgsoGFxvqUGI9ASwun+iw9ncL5dfq087APQTwkKWUPMF7yfhmjHD61RXwRhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwfkiynV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso22371765e9.3;
        Mon, 24 Mar 2025 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742853621; x=1743458421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2YpdWGkegazNf2klfKbGc0M99P0XIEZmajFVkaDbgM=;
        b=mwfkiynV4ksYRcuFB/dFiF1s0nVn++l5oOoT3NwNFZ5cv7CoIAB9HuKL0GRSvBY2aI
         j0d+kKguDNtPVLvx0TxLeOFviJBZZ3pYJi2nbyYzPURm4eMh1uwNaNcxtrmAuasGnC+d
         XvAqfEY1WHeDcxfNPX+lo78Pbrr5m06IpXkof5SllcwafR5B2Uji8saqhSaJpqQUquBr
         EwwjIF9e2OswrBr8OkBy/al7GJZ/j1YNlEk+WbhyFNfxd1kRKKwFPuxR1yRhrVr4JPPD
         4gu2lG9A+hDx4gSdmjsTG0KQOkV1/htsxha4SeDWXzcxMtq5lMAgfEqYyunzL4pDymt8
         RwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742853621; x=1743458421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2YpdWGkegazNf2klfKbGc0M99P0XIEZmajFVkaDbgM=;
        b=GwAvSSzV0J5x/BVUCb5GrDV/b6SBSQ5LXHvgmVLeR9ZOuSppWESMnm7nNkNauSzcWO
         bWwn/sTDfpk3veBE4QWEr9OzI9NyVlc44JIz3lqml0qze89uJvhZ6phyCBGw0zS9QxNB
         rscNOQ9HDzyy6TfwHqihLANtCvR/5qd38/6KfzAzWCG0nG9raPrJ1/khGeLX2ox5373q
         I7jCzl2SSzq49NcF9B+Fx1gi2i0XKI7njNpp9P2JeBFM2oSaBNg2IDsd+sQB+s8plLbS
         G6yDHEPQv10Dd7aCQy/dn+rxCb26TT3z61TiXrR5ad84u8nRKajzpeP3m0oxJemLSLAZ
         MzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7yUTWKoqSib2faxVtbTtWSU6q3S5w4ZuCGWMBb7xWIKM19OE2aLjdrvjrNtJyYa8dZLeOFUThYnm9lTQ=@vger.kernel.org, AJvYcCXt7T6ETLeLAi9FR7eTaaJivPwpdBSe1UD7ZE7kSTlDliYQzDIuB6R+sO3apl9Jjlw+V1dYPdM/1kyXuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/mn0rSvDQYg+FunVGaEzFtzjUNPQV8pKw9KI2Z8U2NB2mn3Ow
	JizBqvXtl6sXb3RXoc54cHziDj4utM9C4WiM5Ip0WRB5LkKC97Se5KFcC0ZOrAyqVLrhvoCq+kL
	ysWOVd8uA8nWn3YamSBdWoBb81H0=
X-Gm-Gg: ASbGncvsxvg5mSYHQkpcOQVJxBFAlxOYPFFyPNvW3a1Zk9t1P3pli3zGjv21MA6+UhS
	sTVrFQ6JEGYlitWqAP+Uz9KVVyLFKCj54c3amJZC9c8Gcoe8T7DIBy3EzDSzyo929V5CEGnzI/K
	q965TRb7o5dIGxQl8m45Px9hm4iNM=
X-Google-Smtp-Source: AGHT+IGIQdKUGDLT7ZkBsz4oPRHqTvjMI6XDp9IXS4MKQVVNgncyu3YecpMRjzROj05syhyckqwlunpao3HnWgiOP10=
X-Received: by 2002:a05:600c:1553:b0:43c:e7a7:1e76 with SMTP id
 5b1f17b1804b1-43d509e373fmr117579115e9.1.1742853620933; Mon, 24 Mar 2025
 15:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324173242.1501003-1-arnd@kernel.org> <20250324173242.1501003-9-arnd@kernel.org>
In-Reply-To: <20250324173242.1501003-9-arnd@kernel.org>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 24 Mar 2025 23:00:08 +0100
X-Gm-Features: AQ5f1Jr0LTV0sn7xM4IaIDNraogN3q0NXArhmlOA0HByopDTVxKTYXLP7U_x9R8
Message-ID: <CA+fCnZd6uLYoKZwwHfBo72C0QLV=pv1feEmB2mMaqP9HKKeo9A@mail.gmail.com>
Subject: Re: [PATCH 09/10] mm/kasan: add module decription
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Sabyrzhan Tasbolatov <snovitoll@gmail.com>, 
	Marco Elver <elver@google.com>, Nihar Chaithanya <niharchaithanya@gmail.com>, 
	Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 6:34=E2=80=AFPM 'Arnd Bergmann' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Modules without a description now cause a warning:
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  mm/kasan/kasan_test_c.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
> index 59d673400085..710684ffe302 100644
> --- a/mm/kasan/kasan_test_c.c
> +++ b/mm/kasan/kasan_test_c.c
> @@ -2130,4 +2130,5 @@ static struct kunit_suite kasan_kunit_test_suite =
=3D {
>
>  kunit_test_suite(kasan_kunit_test_suite);
>
> +MODULE_DESCRIPTION("kunit test case for kasan");
>  MODULE_LICENSE("GPL");
> --
> 2.39.5

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

But just in case you end up sending a v2, let's change the text to
"KUnit tests for checking KASAN bug-detection capabilities".

Thank you!

