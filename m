Return-Path: <linux-next+bounces-115-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C007FD187
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 10:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A58EEB217F1
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 09:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307EE12B70;
	Wed, 29 Nov 2023 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PlpJQXgC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC33DD50
	for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 00:59:54 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7c51d5e6184so297393241.2
        for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 00:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701248394; x=1701853194; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XBUUYQft2seUnlUM4OmCBERBIGRIw1M9PaGf8BE6/Yo=;
        b=PlpJQXgCUWQD7ptz1svyvZ3i/H3+PiIBCwvm2Zft6MQeQvcApLYcP/stVhOI05rC/f
         3rTI/YUG22fXtmbUDH9xz+UuCeL6y/gRZrvSAL0V7yuv4hOPJFFyUv/4AOngYZ47FoyZ
         FwBzwkOzGHz9KYO+lviSpkbYjKz7sWbgkvj3soXovmq59ieo5TesO45eHOQAyReKB1ZR
         /quSCDCOqtElC20yNgf19wXDW7MC3Wq9xvL25/DERlWisi0jit9C5AHzl2pkEk6OJRK6
         p0cWD05HRkGfS7hMNf0LsPQPM+poFK6hM0rhwZtHouwrxmSxwPKGVbKSTlWiSG4N2sVj
         d8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701248394; x=1701853194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBUUYQft2seUnlUM4OmCBERBIGRIw1M9PaGf8BE6/Yo=;
        b=sfer6s7YgaJIuAba9xLTb2JeKzK5r7jTEFF/W1n2DdGl6BO7RcXlq1QRB0slrqQZfx
         WfrOLArJROeKxJ62Pepi4fsuRUCDUZowuR+1MGWiuMFvYLj4fiAezU4lq+4u87gpVqcY
         XGu4lojzpkeJfJRgeqa6L4EoSapf2yKbYcGUijIY0oCR7nQFbHApFOCcWbUSYJ9WioZh
         uBC5Rhb5NOvZzREFDHaA0AC1vAZEzYCL0WnQbWWjwCmC7nk1OVO6HmkSND02IOFXPWaf
         NZp6vvVPuwNjE8iprKdLR3F0oKkrwDv9h1Rq8sz/RQLxr1kw7Fnf22fBpB7AOfbbehFN
         AfVw==
X-Gm-Message-State: AOJu0Yz/FzdA+1rgt5n7KzyUNJUSTx9dki/27SiI7zc5i9mCY9S6ycKh
	BConLIUDLH75mvqXoEG9EXjFrCYCUmgqZKB6E1uABSvKxb1p3rZHCjM=
X-Google-Smtp-Source: AGHT+IEAiYKsp8cH+2h3D9JtZpHKKIWvy5a5Q1QY0jUFvGMVWmqKhCUBJBpd5MooxAaQp9G4F38UYjLP10jlxrC+JuY=
X-Received: by 2002:a05:6102:415:b0:464:3c0a:fdd4 with SMTP id
 d21-20020a056102041500b004643c0afdd4mr4191842vsq.2.1701248394003; Wed, 29 Nov
 2023 00:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYvbCBUCkt-NdJ7HCETCFrzMWGnjnRBjCsw39Z_aUOaTDQ@mail.gmail.com>
 <ZWbjXV85zDXen_YH@archie.me>
In-Reply-To: <ZWbjXV85zDXen_YH@archie.me>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 29 Nov 2023 14:29:42 +0530
Message-ID: <CA+G9fYtByCCzrbM-a4du2b5rJVn_UaCz1HaMZMcBAcfyUBXPSA@mail.gmail.com>
Subject: Re: btrfs: super.c:416:25: error: 'ret' undeclared (first use in this
 function); did you mean 'net'?
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Linux btrfs <linux-btrfs@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Nov 2023 at 12:38, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Tue, Nov 28, 2023 at 05:55:51PM +0530, Naresh Kamboju wrote:
> > Following x86 and i386 build regressions noticed on Linux next-20231128 tag.
> >
> > Build log:
> > -----------
> > fs/btrfs/super.c: In function 'btrfs_parse_param':
> > fs/btrfs/super.c:416:25: error: 'ret' undeclared (first use in this
> > function); did you mean 'net'?
> >   416 |                         ret = -EINVAL;
> >       |                         ^~~
> >       |                         net
> > fs/btrfs/super.c:416:25: note: each undeclared identifier is reported
> > only once for each function it appears in
> > fs/btrfs/super.c:417:25: error: label 'out' used but not defined
> >   417 |                         goto out;
> >       |                         ^~~~
> > make[5]: *** [scripts/Makefile.build:243: fs/btrfs/super.o] Error 1
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Links:
> >  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231128/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/log
> >
> >  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231128/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/details/
> >  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54ID51BFjRBS06YQ3U/
> > - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54ID51BFjRBS06YQ3U/config
> >
>
> Is it W=1 build? I can't reproduce on btrfs tree with
> CONFIG_BTRFS_FS_POSIX_ACL=y and without W=1.

My config did not set this
# CONFIG_BTRFS_FS_POSIX_ACL is not set

Do you think the system should auto select the above config as default when
following config gets enabled ?

CONFIG_BTRFS_FS=m
(or)
CONFIG_BTRFS_FS=y

- Naresh

> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara

