Return-Path: <linux-next+bounces-3997-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93D9889F0
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 20:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9173281FB8
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 18:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4A91C1756;
	Fri, 27 Sep 2024 18:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiXKWTIq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21BA920;
	Fri, 27 Sep 2024 18:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727460825; cv=none; b=i+nc1Oc1+ni+s4k0nIOXLtVWW/JOcy2CkqzaVZ1iM1lE3sjNBSxbRR/tej30YlyMOrefZCiy8404kqWi406JPGp/uc3+9Tj/gsVc+w3emWCIxNut63UD7IqL1LsYnqKZ7dO1hhiIr4Wn7zsuAopB/Xlb1csFPTz8A6xdQRU6h0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727460825; c=relaxed/simple;
	bh=Abz2xYo2kSSHLIykpqju49W0LdoZ8thKHwlYrZcXsZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8BUjpigktAuoqV/U1afkwxCanE7HIP98MkWk53ik+8tE+L9H7VL8znHW/V5siVxpkWFf5k8v7iVQmL7R4gkEpil3s+xzSoE0lJEnUjMtUT0IWgvBKZyugGbqAgNLsay5NyM0HMskc4mKrLoP6z1Jhvy00geTBr2c7mQYVmMaj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiXKWTIq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b1335e4e4so22906305ad.0;
        Fri, 27 Sep 2024 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727460823; x=1728065623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWzKjYDrW40qshQgZ1d+173Jpe147C/yRynqyhtiJHA=;
        b=RiXKWTIqznAk2bJjenkuHgODKuV3zhA9qIv0eLqo068wl0+toCDzJcz2CfbOdFoXyq
         k7KjMCOBfF+MJfzg21UYlN+SFSkLwu5Va6EUa152ZTbL6re2QJiEOMnBExxJPaAfuwwy
         qbBjoMZ9RvHbHYJcFPXi3kUpM8qm+qTaQlcc/J4+As02zG5tUB7/eSFGOp1EhKSyHhlS
         iIAs52xqKdftYrL2W+vUDfsTrR1cZpTIZ/ve9ugmOrY6KlDQqw5p7wbzKiitM6rL/9qt
         I9NavJL1Z0fEs1BSm88XzI93L9IaLXuzX6e/59SmdAE2OTw+syGkiZwuR5+Zl14LsrN/
         j4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727460823; x=1728065623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWzKjYDrW40qshQgZ1d+173Jpe147C/yRynqyhtiJHA=;
        b=MOTtvAIPnGRD2yRXaLFj8f8SAG5GBO6HtN93rx0rbH7wWfyULekzMtNdaXpAL0dsm8
         9ZpNk9OJ5F/hkMnWF3hQUPwDGdeobtkpCdaVg6ncp3IitltYdaQKYWXckO2RlRHmldNN
         sE6c8qcWP1Pce5dtyEu8gcnZ4bPbzF29eJSXIqqCRW3YI8mkzn1oLfXWvqZzsXZnY/gA
         EUojcRZSmMSFITXokhPiEoIuLtpNhjqqPeI/ksYa8jsXhDtoWPVRYRW1CRRujyf8v4hO
         fjciGcr6dLgDcZTwlB+dg8JxwzvkjSBFnFJ5W/CKQrzhYR8q7AnMxCC50R1Jzj0+awZG
         BE/w==
X-Forwarded-Encrypted: i=1; AJvYcCUCQu6dcmLSqYnQQhPhnK1yFEmJgX/3kMVPbiF/SMEoMkqCv/B26F2PYSTKewT8xJqRt/yq6jeFvxzIDA==@vger.kernel.org, AJvYcCUoyDIpusjJBoUzDPVCK6J4fdSLjvztcb91to+OqJjZU8v0TT43hRUECtDmNaIfgJtYl7ZRnMr3v5Nnnqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MhCDNI3DmzaVu7xlgG0uAuoUJJGb6JmdQgXE24mnfu+94pcG
	ehhnB9U67dhQ8FwzNw0BLo8veCEji7D5qWF7+YDaQnLiLCgVVMo5gnwgJ6vNq52KXA4I79SBhRE
	qsMGwe3C4yYudjvxg/dEtpkZwqEI=
X-Google-Smtp-Source: AGHT+IGEcnCEwB277yml7Gl/Yzktb7TKkHDMIWUs5uy9bDW4t7Z6LWQP0E3Wcaxor0iJ/y3iGjrcNVPBBxB6WrSQhVg=
X-Received: by 2002:a17:90a:4966:b0:2dd:92e6:83d4 with SMTP id
 98e67ed59e1d1-2e0b8871872mr4875181a91.7.1727460823355; Fri, 27 Sep 2024
 11:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927113620.7a673f55@canb.auug.org.au>
In-Reply-To: <20240927113620.7a673f55@canb.auug.org.au>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 27 Sep 2024 11:13:30 -0700
Message-ID: <CAEf4BzbU_hzj=BQQC5arRwN5TY+vHS9S9acts=c1kX28C95zkg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 6:36=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the ftrace tree got a conflict in:
>
>   kernel/trace/trace_uprobe.c
>
> between commit:
>
>   10cdb82aa77f ("uprobes: turn trace_uprobe's nhit counter to be per-CPU =
one")
>
> from Linus' tree and commit:
>
>   ca088d067ebd ("uprobes: make trace_uprobe->nhit counter a per-CPU one")
>
> from the ftrace tree.

Hm... sounds like two versions of my patch were applied to two
different trees or something? FWIW, 10cdb82aa77f is the right one cto
pick (I didn't check which one is in Linus' tree), but the differences
are tiny.

diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 87b468d93f6a..c3df411a2684 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -834,7 +834,7 @@ static int probes_profile_seq_show(struct seq_file
*m, void *v)

        nhits =3D 0;
        for_each_possible_cpu(cpu) {
-               nhits +=3D READ_ONCE(*per_cpu_ptr(tu->nhits, cpu));
+               nhits +=3D per_cpu(*tu->nhits, cpu);
        }

        seq_printf(m, "  %s %-44s %15lu\n", tu->filename,

>
> I fixed it up (I just used the version from Linus' tree) and can carry th=
e
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell

