Return-Path: <linux-next+bounces-3809-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BB0977737
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 05:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D491F23D0D
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 03:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6081B150D;
	Fri, 13 Sep 2024 03:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f5JhBZdU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B881AAE0A
	for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 03:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726197263; cv=none; b=CyvxpMPPJVTqZ55BWoaibjO+dxSpZ3ednZLFz/tiAvHTYVraKJwy6qK7IuEtEyud0lQjXVJSVpFOc43pye0HwZQLU06EuH7BvDrPzg3S+JsagUVat2qBFRTzymPctxiLcbB/yXpW/B1KSXSGhnK93M2b1EthAQxt5vS+UlCGv0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726197263; c=relaxed/simple;
	bh=5BChQmZR9pQtxWJQ7KzWQcTI7/c3mxzUoONylUUGkho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsnTpsBO6ZIscyIICV9ooIzVNRaF5pZOdd8QaGApBP/bYk0oThoUCYTAApWDok0WAaO9NZ7r1Kxae+5WoOvZBpkJOsriX2cffdyyuSCPDZdV8+XVQuGB5WolM2J91p8E7opGgaR/Z195T4ajm59by6HL19HYUX9PsX9fSBVlaCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f5JhBZdU; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a045f08fd6so134495ab.0
        for <linux-next@vger.kernel.org>; Thu, 12 Sep 2024 20:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726197261; x=1726802061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BChQmZR9pQtxWJQ7KzWQcTI7/c3mxzUoONylUUGkho=;
        b=f5JhBZdUNjVTAd/CfCT5NZWTF66m8kAprkpGd2f/jtntNRbmKgObjQupMalRquLaAH
         hpj0qa7S+DBPBFzUfQ7LeSQV47BXTX63tQeJfnUgY+HnsUwN/5aUIvpTUhOUl2Fue2l2
         YgWkbnIYj8R6SUDusblB/pXKKtQ6eKQ1ubZ3e8WsKDVJrhPZ8h38jF5InRRQnH/vHrib
         Po6iMUkgPiiC/LuK+Zx/jc7yzqbgDr04W6fVjRHroi8JDId3jxk/0ZHUmjqX0AXcZ6oJ
         M5EckRemqk5I2KPGwGLjdFuDnYBNDdHTRPpaRubCptIndsgrJBCdpZQSl7ZY2zCKM55S
         SkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726197261; x=1726802061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BChQmZR9pQtxWJQ7KzWQcTI7/c3mxzUoONylUUGkho=;
        b=czI6ojffc/3jv0/lRNgfjzOb7Rphpq4oWs6ILsAh8cFoRs6ENPp8QCsxAsIl7VaVKT
         yhxSheo6qCE2WRm5t20UZzRz7+hdU+3NZYNjcVMyeX/1hJZGFdDv7DxeEYAgecvfbQYx
         7vTEy67txfM1ZtlY0LgMWuHhFUpghqjApO23pP0rKq7smnl/53pe87TdkbpxyHI235Jc
         7oI6DBDBCISNRDgrKI8asHOoOZS/81LlGHHIYif3ScHfacN/W9+NTxnNqc09GwuWq2rJ
         6cyKR0731fNtjPKqSJWOOIVvqXEB9zH2/0prDOEM7/bsdTliVjBBaU+ZJV6T4ouyAVQO
         UijA==
X-Forwarded-Encrypted: i=1; AJvYcCUcJrUkOOpbYGB7Mz3ZFO/pyLps1FFKoD5gBXbAOUkSeMeTHMO1qitwEfcXNHVrhNIcMnhdunD8BHow@vger.kernel.org
X-Gm-Message-State: AOJu0YwlR3aeKwCHzakog9N1F8esOPq/PWjF29AQqbgF+8Sq7rg8M0Ki
	8xDH0cAyQAyQotfukCUEv2DsLE3JNvLQ06gUQC4LYuEM9msN54pqh7SYYnzKgLUeJGfIFW6w0ud
	yQYGcxmI2f8p7uOyH9yTQ6W5vR/JC+BIBSawQ
X-Google-Smtp-Source: AGHT+IEkxgqPsNKDnds/eVtEysPWvXFKKgL74eRXd23NGUL72xMyWQkoPszPRpk08gepJWlb8EHEze3Z/SeEv8+HjdA=
X-Received: by 2002:a05:6e02:1d1a:b0:39d:2555:aa3e with SMTP id
 e9e14a558f8ab-3a0856cc931mr6139495ab.17.1726197260479; Thu, 12 Sep 2024
 20:14:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913125302.0a06b4c7@canb.auug.org.au> <20240912200543.2d5ff757@kernel.org>
In-Reply-To: <20240912200543.2d5ff757@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Sep 2024 20:14:06 -0700
Message-ID: <CAHS8izN0uCbZXqcfCRwL6is6tggt=KZCYyheka4CLBskqhAiog@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 8:05=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 13 Sep 2024 12:53:02 +1000 Stephen Rothwell wrote:
> > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is=
 not a multiple of 4)
> > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229: net/core/=
page_pool.o] Error 1
>
> Ugh, bad times for networking, I just "fixed" the HSR one a few hours
> ago. Any idea what line of code this is? I'm dusting off my powerpc
> build but the error is somewhat enigmatic.

FWIW I couldn't reproduce this with these steps on top of
net-next/main (devmem TCP is there):

make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnu- ppc64_defconfig
make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnu- -j80

(build succeeds)

What am I doing wrong?

--
Thanks,
Mina

