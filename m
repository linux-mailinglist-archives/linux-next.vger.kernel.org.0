Return-Path: <linux-next+bounces-7030-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651EACCC40
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 19:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08B7C188830E
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 17:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509511C54AF;
	Tue,  3 Jun 2025 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="csHHoOrj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930532C3246
	for <linux-next@vger.kernel.org>; Tue,  3 Jun 2025 17:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971986; cv=none; b=Ib1Hi4h3QvFrUI7R1K2w1bSK4HLZ49x68OMoFdw2B98lFo02+mjhwf+GQWP+0y1OeYjBx6qY4ROKvM5xE3cNG/7NkEdYJpxtlrjaHrogKuIrjpDQdN25wdBbgBvddtywPDR2SB+gBjT46OPB8OI0zCHXBhf0RtU9x9hCEcnb4FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971986; c=relaxed/simple;
	bh=IYRTv37f0uAvhgqHBbq58c+XeY9Iity2eS8ZW3GDbsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEgWe3HsViGcT4Ei4VCoy3kBQ5NAzo0gmWE9NjTJEefEmEJ8cJxOWoKQQsMJtCjPeON0xWTTEpzFYvwlPF/R1vyePr6VK79HotkbrzJ0l54+sdMHKwXNRav1Pn2CmljwswYXsOa67ILLlg0RoQSlYn5GkRX2yc6ckwImkPR5S0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=csHHoOrj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450d726f61aso4135e9.1
        for <linux-next@vger.kernel.org>; Tue, 03 Jun 2025 10:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748971982; x=1749576782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3DNB/shSlIZz8dOZO0PAxfLgN7msaxB35LPno5m37A=;
        b=csHHoOrjUpiwFht0Ui5MNUUp9Ehu7M7ap3sDUBBw+tuqTInvD5lR49Olb4xNeWcNVt
         U3ZSI8hfYR3yyWXOrsjPvj7DsSxlhifsy6iWq1BNpaJFtSmw8e1ni0HJstRYZU2tVHim
         cKmjF5vxr+7OFJUstU46uesn2/Wkpru8OEOz5nNa2HVo5d8Br76FBmFKtD7yxmcpHX6b
         Vcf2afcp6NNsZPfdZsgbdAhSF10ajTJ3AZHgh9z2kC+6DvuumAW6RFvcw9xH2C4mN7Vg
         Wq/xHITWRDPvR5POk7jQnVgT2TcuLoQ2gff5QzttcOwVSACbyRea2AbV5d/BsEX17rlm
         GLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748971982; x=1749576782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3DNB/shSlIZz8dOZO0PAxfLgN7msaxB35LPno5m37A=;
        b=Gg+wiEeRCabTwtdsGBBDJBI6+QgYgmE2xs2Jrmsl30TEIMtfeDIusNckeJWp15HyA3
         34SWSPaT2ay7mcuSsKAf3kM7utrHNL1TdRkRni9ipVMzRtigjXcVFmIKm8eta3/iyg7k
         lUOsGAUmUhJSQ8BSmTDRz4V3iPT7EFJLdOQDlLwwdvzaU43kkxiquugCDdn4LmyCj9Q9
         w1LGriG8WPE/GDDz49/BZS7uzFNBnMG1gv7YO+M2+gUGEQVrhjG+K/t7Ddifte/JhVW9
         MLNG/goih5U4NNvZfeFjcTJHA+7D9riIqqym3Ufh0rMh4G2Alp3H34FOIT8EM5KzBmZp
         kscw==
X-Forwarded-Encrypted: i=1; AJvYcCUmbcZbDV2F9AwAtA33p6ex6l9971NpckzuBA7hh87itgxtlpYVRf3YCY7p5ThzmkSrRFXcMUsZJGL4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy38bPrkm0BAqg0CZ2AFEqDfctXKqodw4QpcjT4tAqT3OAttx6I
	CkA6WPKR1S7WJvXqqSmhDIAHtkF6dLJRqNh3zK6O70rCcolBnCVoXUwCxwxLRYcQA9x6K70yygT
	n92sFsov/bcZa+D8sU8zmpdbkXlSM+DfYxnk6m7Gu
X-Gm-Gg: ASbGnctOtFgY2u/dPt8pLMhJOUF5Q2JNTg40EbYG1pbYvufLvXvlz1U8Zqa/1uNeiCl
	sqnqxRyN4JXGBzym5NsvR8pJtNOsI50aCMFZpyGw38yrQguWNUGtFHPn/v9NpAzKDpyEi2MEpR2
	haTxYLlR3uerFtubabH0aFzcMUI43uaU8rxg6oe7v7VGpP6468G3/WA3ruxwy6ayOnfR92Z1kIO
	QFuIg==
X-Google-Smtp-Source: AGHT+IE5RpbI9i3VQlMwjstuhtmZuKuBbcLSJceXcPQJ2BYROgUR3GWT65tiB2IFB07QZ5CCVl50ncZ2S5JQxuvnor8=
X-Received: by 2002:a05:600c:30d4:b0:450:cb25:ead with SMTP id
 5b1f17b1804b1-451eb58e9c9mr835145e9.7.1748971981642; Tue, 03 Jun 2025
 10:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512091108.2015615-1-skb99@linux.ibm.com>
In-Reply-To: <20250512091108.2015615-1-skb99@linux.ibm.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 3 Jun 2025 10:32:49 -0700
X-Gm-Features: AX0GCFuqlHrfWIct6r9G90nzVWpgl53GzuxHT0BMpJtXN72k8MqZgekAcGOuib4
Message-ID: <CABdmKX1nhR3BXKyuLaAoo50KNyBwaexmH+af_s8WxULJUZ9+pA@mail.gmail.com>
Subject: Re: [RESEND PATCH] selftests/bpf: Fix bpf selftest build error
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: gregkh@linuxfoundation.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, hbathini@linux.ibm.com, maddy@linux.ibm.com, 
	venkat88@linux.ibm.com, sfr@canb.auug.org.au, alexei.starovoitov@gmail.com, 
	daniel@iogearbox.net, mykolal@fb.com, yoong.siang.song@intel.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 2:12=E2=80=AFAM Saket Kumar Bhaskar <skb99@linux.ib=
m.com> wrote:
>
> On linux-next, build for bpf selftest displays an error due to
> mismatch in the expected function signature of bpf_testmod_test_read
> and bpf_testmod_test_write.
>
> Commit 97d06802d10a ("sysfs: constify bin_attribute argument of bin_attri=
bute::read/write()")
> changed the required type for struct bin_attribute to const struct bin_at=
tribute.
>
> To resolve the error, update corresponding signature for the callback.
>
> Fixes: 97d06802d10a ("sysfs: constify bin_attribute argument of bin_attri=
bute::read/write()")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/e915da49-2b9a-4c4c-a34f-877f378129f6@=
linux.ibm.com/
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>
> [RESEND]:
>  - Added Fixes and Tested-by tag.
>  - Added Greg as receipent for driver-core tree.
>
> Original patch: https://lore.kernel.org/all/20250509122348.649064-1-skb99=
@linux.ibm.com/
>
>  tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools=
/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index 2e54b95ad898..194c442580ee 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
>
>  noinline ssize_t
>  bpf_testmod_test_read(struct file *file, struct kobject *kobj,
> -                     struct bin_attribute *bin_attr,
> +                     const struct bin_attribute *bin_attr,
>                       char *buf, loff_t off, size_t len)
>  {
>         struct bpf_testmod_test_read_ctx ctx =3D {
> @@ -465,7 +465,7 @@ ALLOW_ERROR_INJECTION(bpf_testmod_test_read, ERRNO);
>
>  noinline ssize_t
>  bpf_testmod_test_write(struct file *file, struct kobject *kobj,
> -                     struct bin_attribute *bin_attr,
> +                     const struct bin_attribute *bin_attr,
>                       char *buf, loff_t off, size_t len)
>  {
>         struct bpf_testmod_test_write_ctx ctx =3D {
> --
> 2.43.5
>
>

The build is broken in Linus's tree right now. We also now need:

@@ -567,7 +567,7 @@ static void testmod_unregister_uprobe(void)

 static ssize_t
 bpf_testmod_uprobe_write(struct file *file, struct kobject *kobj,
-                        struct bin_attribute *bin_attr,
+                        const struct bin_attribute *bin_attr,
                         char *buf, loff_t off, size_t len)
 {

Should I send a separate patch, or can we update this and get it to Linus?

