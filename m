Return-Path: <linux-next+bounces-7096-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D6AD0B46
	for <lists+linux-next@lfdr.de>; Sat,  7 Jun 2025 07:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 205313B1736
	for <lists+linux-next@lfdr.de>; Sat,  7 Jun 2025 05:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5080C22083;
	Sat,  7 Jun 2025 05:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUzWu+8G"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234FCFC08;
	Sat,  7 Jun 2025 05:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749274746; cv=none; b=iB6GC/eCN1zlzu7iFjL1jCjC29M5fbNIzAsK+S2zzDvxvE6Fm6Nrhmo0KX9i2XHx3ZbNu2lew/sTP6tZIVZ1e5SnEm2zYDnv0bUUjzLCW6qrEdlfZJc5C7AXapoJOI/pIJgdNn39LZSXK1tYifYmlV4lJ5XHbqMIo8K/hhUv6h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749274746; c=relaxed/simple;
	bh=AVThBw/F33fAeb2r1HgHu8ZbHxRoQavzAslSvTHulLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuSlANtp+aCfpf04OThFsxRKJjalRp36GPAlNFPalyeimXdfjUTc5lte044Xu8XxY+i/ArJnzTBpHIbvHgVogQ5Rs4OQbdDRAOxDdXFfLPB1fj+WFYXhB+CNN5gcL8QRBkU46P7BHBj9+p78tTTpvzZu/LxLepiJr9F9MUvyHIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUzWu+8G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8A5C4CEF0;
	Sat,  7 Jun 2025 05:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749274745;
	bh=AVThBw/F33fAeb2r1HgHu8ZbHxRoQavzAslSvTHulLw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CUzWu+8G+kFlFl5yy4QydF4j3r5jMreiweCGJl2URKy4YcWCi2P9bePeTuSD/xtmM
	 mRJ4PKLRILilB4+uVEo2S0P2kU5At58gl8EfAwcy4KNjfzkP7VZWmZ24MyeiOtHe4Z
	 0kdLKuFVYcmBEQRcpRjwTKUNgWhaOEmlNym2N4xx96WJofEO5dRw4rDnFfPZCDrnWG
	 nsmd+VD3Bu0WBH3zv7cIjpRr2AqWPP9BYyGqne2toZXJeuMSL7mk82OqWr6T8hZQgC
	 tvJuQYDvXwFPlXtCMUUTyMs3z38AstQ2y2ZwL+DIoLoYHPdzCZUWRmaEzTU5eq32JL
	 ecYgFW/3KMNHg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5533a86a134so2691369e87.3;
        Fri, 06 Jun 2025 22:39:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/p85ruCsjAQz8/BA7m7PNVTv+Wl1V+S7BQ49tvAANRuDQJbF348fGT/eJBzCXf27/CktWRY8ps28s@vger.kernel.org
X-Gm-Message-State: AOJu0YzYNXOe7HkMpGQSIkdfKsyBlJyCgndvsd3ZXLf2AHXsSS3jNIgC
	6D/QGHZJzHOEA6TdMEOEnsGzeLeRHiTs9TEavtDGk/ODetB9t+nNY5SWtUa0mqQQIjMQ5ifwe8T
	gv9m23jt8GBoLuJeYVtnEyAEEm09VkDw=
X-Google-Smtp-Source: AGHT+IHuxD3D0b+KPglNs5+al6yPwC3eDxiUtjLJrZ8CrxSPS9EnyZWM1loozXqR5KbCyXhknFbzm1XH0Z7NW1+2HuY=
X-Received: by 2002:a05:6512:ea1:b0:553:2191:d334 with SMTP id
 2adb3069b0e04-55366c0e5bdmr1787948e87.35.1749274744355; Fri, 06 Jun 2025
 22:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606140126.10b191fa@canb.auug.org.au>
In-Reply-To: <20250606140126.10b191fa@canb.auug.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Jun 2025 14:38:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_5U6qr5f+i9AY5UYmVZcC7YE7hgMYJQ7gtN_Vw7=WKA@mail.gmail.com>
X-Gm-Features: AX0GCFtw9MN79PH0yaN6g8aK_M_w7e-w2wf0mT2xdCmKoKm8GUe21rA7GiwVwvo
Message-ID: <CAK7LNAR_5U6qr5f+i9AY5UYmVZcC7YE7hgMYJQ7gtN_Vw7=WKA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 1:01=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the kbuild tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/kbuild/makefiles.rst:1104: ERROR: Unknown target name: "non=
-builtin vmlinux targets - extra-y". [docutils]
>
> Introduced by commit
>
>   3db6f0026e85 ("kbuild: set y instead of 1 to KBUILD_{BUILTIN,MODULES}")


Fixed now. Thanks.


--=20
Best Regards
Masahiro Yamada

