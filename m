Return-Path: <linux-next+bounces-8290-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00897B555A6
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 19:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7405C0AF4
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 17:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD80329F18;
	Fri, 12 Sep 2025 17:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSN3kVvJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E8326D77
	for <linux-next@vger.kernel.org>; Fri, 12 Sep 2025 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757699741; cv=none; b=fUajQ4f1J7UhA/XA0L1VksJvr/CyWJHGtBNrpWXuJtntpB4q1ik62+p/gggoL/XJpw3xSFqoN1PhzpduY4EG/JTFVoZhRJ+32MwZnRoVs+SXWBcRANtzJf2Z9qAVgf3Y3b+v791oUq46phnfnO24oeQekX7EqUuB2Vaezc4F0kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757699741; c=relaxed/simple;
	bh=21udc6JLttU/l5KykgHLGN6cnqZbUcu6oJMFH12Gbc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoxWPu+DIWYKyTNJfvSADkWBj/YbC9liJLXsQcJFAFXK8XpH49vBeha1CjUR2FPgdBMbou/2zBOKVSFP9IvBxbOwKvxca8DNdm+op4j+cKtZ4Zz6xTfH6nr+LgdeC4GGOMZuywxgGucMm7hNp4eSCh5ExG9zz+Aw6vCZouzI8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSN3kVvJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e75fb6b2e2so2325084f8f.3
        for <linux-next@vger.kernel.org>; Fri, 12 Sep 2025 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757699738; x=1758304538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1hqm75GbQcmUVjrwGt63wYxMp0L1ujfuRL7MiRNqrs=;
        b=XSN3kVvJRH5ItNq2CO3DlPwO5D+SEi2EvI22vyF6fgjL+J4+DykHkhPn8ye+UDIJ1b
         jKr7uJaYWJSfPfBQXLkWk4w/DqtkKP9p6rIJoG8MP5iVm0sypCbTyVeJR025OjqP5QLZ
         150Md+okjlmJu7r6PQlvMvX2rDiSs3OE7abFFd9UJfsH97t4DeKWqD/knKeOxsOD0V6L
         rgYdTCgLx91yZK6Yd2xnFC9OzfbL/uIuFiDZ1VMGvZ5aJJUNDWKgNtUj/2dDP1twW5X6
         ha0pW4NM0j0WI/AhGKHc/OvMfUSdMXt7SgQmYZORrfWDe0jYmfKxev3jfnKh7kBfAE1s
         HEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757699738; x=1758304538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1hqm75GbQcmUVjrwGt63wYxMp0L1ujfuRL7MiRNqrs=;
        b=TqFCt2M78bJ9ibmVYt68jtJEUOqP6msVkbAY3DhiG2dFWVAgIhb+DcTEBY2AoJpss/
         yNvl8sdMeQ1bdkAnmy2/JiQqsDFNaRYFT7Lg7wpEPjaCVnjGLHkMdJr9pPfKNCsnqZa1
         cjijTwnfWxJ3rPtkqiUAciFt++meAbw97JgL66IWp47FGRswzoewUXpM8OPi6GDmUzaC
         ok9J4KMQkYNsXtRK1F38WZ974pDZBoLGH5BvWgvebJctSWbj8kJJKgKK5m2lrojckA+e
         04psOpPFWiEw0YsmxwA73x6GSaFgXQRUKjXVoTGvzSw9m+uiHvzCDogsXAj1KmeZnNsC
         5cSg==
X-Forwarded-Encrypted: i=1; AJvYcCUe0N1MiNljvyFeH5b5c04BvI0ufHyJ6iyEkCSa+8zAbH0FUSK9ZrFQtiBOlDKFpx/8Y8GPkf6jvT4J@vger.kernel.org
X-Gm-Message-State: AOJu0YzVxBfsX6EvMKHCljQZBltILUFnwgnCgVBQU6Ld5eoUI8k9rirn
	bk9LgthYXFmPCqZ4KIXoJGNFpHs0dzL/GL8RD7uhhpS1DOrApVqTGKGAtOUGhg0UCR6pswyzsII
	3eIhmAv+ZgOryV4C3lingY5jRjq8DsDM=
X-Gm-Gg: ASbGncttlki/GQQXtQpkWYJ41e7ppQxfHiIM/KBba42zUP9POVKM8fAdxTaKNKiBzO1
	2pv24ck5fMPIO1vrzNzamILcELuKQOtm9nPqRqaRlg73FsHsqzfiiRGZrJQFbX0ZbcmOlRUTlV5
	O/8fcT0Baah2t2JIQVuhjKJBVXhkSkyTfzQoD67YGktUMl34t8hLxk7osNh4bWTYbMDX8M+5fO6
	nhxGWcZzLbGQC10lvVSEqL2CzzuXtmgnRCJSyvz/KuGp2E=
X-Google-Smtp-Source: AGHT+IGkgj6IrkdGUDNbAf51bRnusq5rydfcWtBFKBRkglsxY7vTPHWpp7JaetFcOJOedb2SaAMVrhhCP6B4H3UnkTM=
X-Received: by 2002:a5d:5d09:0:b0:3e7:17d4:389b with SMTP id
 ffacd0b85a97d-3e765a1b499mr4151861f8f.52.1757699737563; Fri, 12 Sep 2025
 10:55:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912124059.0428127b@canb.auug.org.au>
In-Reply-To: <20250912124059.0428127b@canb.auug.org.au>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 12 Sep 2025 10:55:26 -0700
X-Gm-Features: AS18NWD5ST2IJKM1utHYQwt-Xxi_J7BVpfEK88PJRAO0c4SRtSvsWIsTf6DJ07M
Message-ID: <CAADnVQ++ULXeQQ=oLTXvoo98QSrk-afc=H5Lq9Pm_LyH3X=sCw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the bpf-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiawei Zhao <phoenix500526@163.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf <bpf@vger.kernel.org>, Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 7:41=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   tools/testing/selftests/bpf/prog_tests/usdt.c
>
> between commit:
>
>   69424097ee10 ("selftests/bpf: Enrich subtest_basic_usdt case in selftes=
ts to cover SIB handling logic")
>
> from the bpf-next tree and commit:
>
>   875e1705ad99 ("selftests/bpf: Add optimized usdt variant for basic usdt=
 test")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for headsup. Looks good.

