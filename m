Return-Path: <linux-next+bounces-352-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C333080E4CB
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 08:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2E01C21F86
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 07:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61883168A3;
	Tue, 12 Dec 2023 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SSgLdLih"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77550AB
	for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 23:25:07 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3332efd75c9so4806931f8f.2
        for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 23:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702365906; x=1702970706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B27xiFe5ZInauBvN5IV6bsU1xf8ZxSkrwGh2mtgiMg=;
        b=SSgLdLihQV73VPxiFczii2OdFuOwresxy1fIXyZ4qHoptUMEAqfrUz+ylKSsPw1eT8
         QTSjcp7Z9GlWDXq/kIzCBvFlXrE4dZgxYn/VlXQ21jI+Yj3Amu0Qp95tBRhjvIU9wHKI
         MmRra8peARb+jbyrCXavHT9kVo204k6P5tWJbl3W6Zb3PBmTYNnPP0VuDP/k+N0+K6ij
         GLGE7kp5VHHGaNxbPv5f4kKwQmDjP7hBeOTh7YHMqRO0isNKRqZ218h6vT/ZR0ej6VlM
         T2NEX/oayh3Xuv3j6Vjrx15wO04MdkmvWfpa0j8vN4gsfBDhYYg8n12STLif5o3cZDVf
         NYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702365906; x=1702970706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/B27xiFe5ZInauBvN5IV6bsU1xf8ZxSkrwGh2mtgiMg=;
        b=VO5EXNcSt4ckEhsF6EDoKwPyn+3fjY+V8U+50BnaakgOatyGOO4Spz3jScDDGF4zC0
         JTyv/6l04Wc3Kt3I2BL9LYIAafEyl6tIwUSsBcIWbufkny5mg057YdqjSIJrtIAvjJ0L
         1surHAkW0JlG9/7nC8ZP7m8PQpM3n4725HRmLfsOzLzK7q/O/eRfLTIJ/grizBihbnqr
         2FEFv+/xHK2+88C7wpEl8uRttG0hZc2Wt58EO1lkdL2bonUGuALubTtIH102ZRajv0Rm
         mYV+33LEGgVjyOA8yTt7/IWyMoM54l9lNMCx07fEccBSpGSg2sjgnQ6cUoxVUx2rwYEY
         zAtw==
X-Gm-Message-State: AOJu0YzB0vxGp0R+sLabUAkVimyS7QJK4BPcPGtnPgbTO1LCHHzK31qp
	957lFlLjNY0WKFbpQMUmvZV9ZXvUiF+a1s5aElSMZw==
X-Google-Smtp-Source: AGHT+IH1Fb9rddRA5/WR8NmRfrJizAad5afbmusjY3Kdfxu/oah8d3lJ45zcFFksR2gvQqvOR8i0RRi3MOJa5cw/QqE=
X-Received: by 2002:a5d:6205:0:b0:333:2fd2:7678 with SMTP id
 y5-20020a5d6205000000b003332fd27678mr1229203wru.105.1702365905783; Mon, 11
 Dec 2023 23:25:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211172504.058ad6b6@canb.auug.org.au> <846f4d8a-16ad-4ce2-9bcc-34e03f057421@infradead.org>
In-Reply-To: <846f4d8a-16ad-4ce2-9bcc-34e03f057421@infradead.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 12 Dec 2023 08:24:54 +0100
Message-ID: <CAHVXubitXvkWmvHd7JXs5kTZC4L2VvOD2B_ue3D5hUhevOpwfA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 11 (drivers/perf/riscv_pmu_sbi.c)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, Dec 11, 2023 at 10:22=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 12/10/23 22:25, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20231208:
> >
>
> on riscv32:
>
> ../drivers/perf/riscv_pmu_sbi.c:1015:35: error: initialization of 'int (*=
)(const struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*=
)(const struct ctl_table *, int,  void *, unsigned int *, long long int *)'=
} from incompatible pointer type 'int (*)(struct ctl_table *, int,  void *,=
 size_t *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, unsig=
ned int *, long long int *)'} [-Werror=3Dincompatible-pointer-types]
>  1015 |                 .proc_handler   =3D riscv_pmu_proc_user_access_ha=
ndler,
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
> ../drivers/perf/riscv_pmu_sbi.c:1015:35: note: (near initialization for '=
sbi_pmu_sysctl_table[0].proc_handler')
>
>
>
> Full randconfig file is attached.

I already sent a fix for that here:
https://lore.kernel.org/all/20231207083512.51792-1-alexghiti@rivosinc.com/

Thanks!

Alex

>
>
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html

