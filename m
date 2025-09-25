Return-Path: <linux-next+bounces-8492-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F89BA00B1
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 16:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A46054E48E6
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 14:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074072DC79C;
	Thu, 25 Sep 2025 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiyB1Sw6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C08F2DAFA7
	for <linux-next@vger.kernel.org>; Thu, 25 Sep 2025 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758810869; cv=none; b=FT81oQmtTUmcrr2TunF58SoLtEX+N53tz4Mtq7WrrvEdq6yJNaOaMK8g7eFFysZKAycaEJ5IrjUzhNhecSqUOb2y6iev/jHdiygQfqtCtyQoPANy8RfK404gbd8cv6daGp3VOGgutx0eMVTfA9KuzIAzk3StTUgahCJs41yLXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758810869; c=relaxed/simple;
	bh=6XA+llkjZZVH29f0iycatx4vb1CIaytfaB6lMJvlB8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+CBt2yriRpiLeKenJAuMVxrCBGq71JczgJEMG3ghk/piJo5IIlKR0G80/BYQoWjGUfR4weQC+kERm19Pp5/RZ0aKdNyNyWmChoSJG16LTJ0IucJQR8WQrHmKHl1rAbeQo06k8meBdxGlYeEI0cC8lIZiyUjxc9i2c2XwcI8P14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiyB1Sw6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so1098600f8f.1
        for <linux-next@vger.kernel.org>; Thu, 25 Sep 2025 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758810866; x=1759415666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlmWZnzTQZk7hQJHDjRsw6Fn5BINueet3UHk9KQ1rXw=;
        b=JiyB1Sw6yUHbhPNARjgB4h0+sV8ZsDI4K5+GauNR+yjB9Z+0sSh+OCV6cwu+Zmy58A
         2K89axmqBy3UG31xs/Vn1wfEY6b+I1vuUw/mA3teMhdB/VKWNd3vDD2hqJ0pry5S6kuA
         kKFZlxp4k8gKWRgjG40R9/E+nahiBh4By9DtI8wLbMC4o15IiqI59nyDw+4poxadzpQ6
         TcwUfPORCj4cIukSELq+Ta3E+9vgvTyxpFcilxiTZxDrSFYQQ1+6tFAl581MaJiwmlns
         CG33l1GwMqQdNX4ReQ5ccDlvPohTWUGTMhRE4gIPz1ysNXQVpUiPz5tgSccyKo8CeAnH
         y4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758810866; x=1759415666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlmWZnzTQZk7hQJHDjRsw6Fn5BINueet3UHk9KQ1rXw=;
        b=Uvs1tYjHTarfdegabtqzScYKvfbBtGQE6tOJ8Ld9lyDTjVkgtOV81dqO0LmjSbthBS
         m4C32mZIbKu8dDD7qmEnPK1eZivMZQQ342GyOb0OauusPgAfaMPJpG7wFCvT4eIYZ3iS
         ajD/W5R4VjuS7jGKSgRKPAKOeVjkxTuLuJkKZlUwlcx3GhWDPeBCuhBvwjWx8jZp9WzX
         ontjoSGI3X51OzSicTZXOwGtNRc6tomxKQuvPZ+ObTZj67KgXvRK/7G9PZjNkPSfh82r
         qRWYv/Eu9GADFV4/QCLJhcNQfiPG5PMAJ+OE1bygegyMEDKUyR37tVkxMuU7b3nVVmiJ
         3+8g==
X-Forwarded-Encrypted: i=1; AJvYcCWJx+phB/EtV7+z7Jrjc9kCH4lHTxIwSSw4id7ceXTWaNF49MMC+pffSSmZxNkhO5DnmpddsDECbgOv@vger.kernel.org
X-Gm-Message-State: AOJu0YwvOoVWbCepZ+TK6hwh+j7IeTwVXTb5oQpHVC+SyYzBqXxxOqKn
	SQzRZ9iZvtLMI6lZpiexOnPUL92JahpS6/lb8L1rdVxORm+trNuBbVdsBlzNpHTo3zPRrGqV1JL
	Dw5K0vg5zl0mGeWxcel+rG/V+0Qxs64U=
X-Gm-Gg: ASbGncszYZ6yr4EgKyS8jm4qfCl8jD/w30WyjINPHiSemTsYt9Wi/vqOTF8dr/8hlnW
	4LDcyIaVgPwxWqoCtgWZSqZN415ixO459SpB0Ph1rXA8aIq8wX84zisyHizOGc26Dpa4gsn6gth
	Q5c/Ex1Ou2QRpdZYhwmJ0bPBzccF31skp7r0dpLEtE0ZrhFiIlwiFwTI2Nj/0SrrM+kA+9W7lkc
	p7YxQ==
X-Google-Smtp-Source: AGHT+IGY9M679gafputQhuXv58U54d1hWGLNXuPzatEJA13krdUY3caj/cCKqU06kl7/8uBnZ3uP82zoy5jzM0Zo1PQ=
X-Received: by 2002:a05:6000:2486:b0:3d4:f5c2:d805 with SMTP id
 ffacd0b85a97d-40e4458c89bmr3769232f8f.16.1758810866223; Thu, 25 Sep 2025
 07:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNVMR5rjA2geHNLn@sirena.org.uk>
In-Reply-To: <aNVMR5rjA2geHNLn@sirena.org.uk>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 25 Sep 2025 15:34:15 +0100
X-Gm-Features: AS18NWD8ZUmLb0ORW8a0yDbsVq0TSmHChIah2vxBghBU5_0NKGLYU8EJzRAlptA
Message-ID: <CAADnVQLcNWCsazy4XudB4EPaqvdtea+d8w5q4R5MsvRJ4fmOmA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the bpf-next tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 3:06=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   kernel/events/uprobes.c
>
> between commit:
>
>   4363264111e12 ("uprobe: Do not emulate/sstep original instruction when =
ip is changed")
>
> from the bpf-next tree and commit:
>
>   ba2bfc97b4629 ("uprobes/x86: Add support to optimize uprobes")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc kernel/events/uprobes.c
> index c2ff256dd6419,996a81080d563..0000000000000
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@@ -2741,13 -2765,9 +2765,16 @@@ static void handle_swbp(struct pt_regs
>
>         handler_chain(uprobe, regs);
>
>  +      /*
>  +       * If user decided to take execution elsewhere, it makes little s=
ense
>  +       * to execute the original instruction, so let's skip it.
>  +       */
>  +      if (instruction_pointer(regs) !=3D bp_vaddr)
>  +              goto out;
>  +
> +       /* Try to optimize after first hit. */
> +       arch_uprobe_optimize(&uprobe->arch, bp_vaddr);
> +
>         if (arch_uprobe_skip_sstep(&uprobe->arch, regs))
>                 goto out;

Yep. That's exactly what we discussed.
I'll mention it in the PR during the merge window.

