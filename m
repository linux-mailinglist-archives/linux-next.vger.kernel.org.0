Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D29A6C53D4
	for <lists+linux-next@lfdr.de>; Wed, 22 Mar 2023 19:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbjCVShy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Mar 2023 14:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjCVShx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Mar 2023 14:37:53 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7532F664DA
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 11:37:48 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-3e0965f70ecso111551cf.0
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679510267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEa8ZQqJY8c5a1eI+uTtPtBep6jdcYziCgq9THKTvCo=;
        b=iaBltZp9qgru2Qr3xnojKVvwqTNKD1oPtsnZa8t+n6FSRhnJGOH5TcIWXWcKka995w
         CMBwMzxyQl1qczGtBz+RjE3CvIWwXWJVXMUq2QWAD8+o7RmzsWK8jldL6jNLlrq4DgWG
         shn0ET5yp2w2CodN/m9HhGBuAeQhBPhB2zS0heDVySNeQcFQn2K3y+C+DhDN1CtnlVd7
         wHQ/fYSWSbz4XJRmyu/FJ3AQ6TVq3Gz2MS3KkYo8rH0SXQMMGT7uGtHPnPkh/wQX7I7n
         o6Y9Nn40NoBRSjdBhP21GmzrCvXHZn/93Ujy+Zl4v4EpZF+8PRT2dkMG9xSvqJnlFvtL
         75YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679510267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEa8ZQqJY8c5a1eI+uTtPtBep6jdcYziCgq9THKTvCo=;
        b=jxGjgBjc9wASFbqjJsG6z1UrkI51WFydAV6n9n9MVfUK9xwom3o8ickXvbVEzLTisf
         KAZOEbpwOnb9nR0iBIV9E8yUEO+Gkaz7l3+AwGEHmQl8FRYxa8qQgfnALJ0/GQrXhmet
         W/CmYTuYHaBk1Q0vXlno463iSF0rhZWPe17b51qfm5zDY36j22mkfbvQZlfHYBkSF0Me
         7g42MXN2rrTBJGCMev5FPigZnt99Yn1nYl4C7x5ZRR3PB/Y3RWcLnbXK2Mmh4Ecdqoph
         QKizAN+CPN8DYyIBa3AVKYdkotzfBOPk0YiNRWFGsUjtZk7y7NZdea76JQwrQiq+ztpd
         ypKg==
X-Gm-Message-State: AO0yUKULT4gQDqgpWwjPahrw3UbfKxs+vx3WGUG4BmHf+L5b/KAl2i4K
        oZjz0IBq09e3pIlpNnEHHNgoZTIYWQi6LHhXKiFr+w==
X-Google-Smtp-Source: AK7set8+MTulszs4pATd9dbsaBEA2GjVGj0CpFE+w5e7zQlI3EMpBbPUC3d6xZYXZOaX04NLlz87Jx3DafILCumhHVw=
X-Received: by 2002:a05:622a:1a16:b0:3e3:7d41:719c with SMTP id
 f22-20020a05622a1a1600b003e37d41719cmr476728qtb.1.1679510267435; Wed, 22 Mar
 2023 11:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230317095025.49aa34f9@canb.auug.org.au> <20230322083956.5c051777@canb.auug.org.au>
In-Reply-To: <20230322083956.5c051777@canb.auug.org.au>
From:   Ian Rogers <irogers@google.com>
Date:   Wed, 22 Mar 2023 11:37:31 -0700
Message-ID: <CAP-5=fUHqrQWPjk7QJB=r2Gzj7z5X3nL4bRuBAKzy2HvdSAr-A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the perf tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        namhyung@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 21, 2023 at 2:40=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> On Fri, 17 Mar 2023 09:50:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the perf tree, today's linux-next build (native perf)
> > failed like this:
> >
> > Auto-detecting system features:
> > ...                         clang-bpf-co-re: [  [32mon [m  ]
> > ...                                    llvm: [  [31mOFF [m ]
> > ...                                  libcap: [  [32mon [m  ]
> > ...                                  libbfd: [  [32mon [m  ]
> >
> > make[1]: *** Deleting file '/home/sfr/next/perf/util/bpf_skel/vmlinux.h=
'
> > libbpf: failed to find '.BTF' ELF section in /boot/vmlinux-6.0.0-5-powe=
rpc64le
> > Error: failed to load BTF from /boot/vmlinux-6.0.0-5-powerpc64le: No da=
ta available
> > make[1]: *** [Makefile.perf:1075: /home/sfr/next/perf/util/bpf_skel/vml=
inux.h] Error 195
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile.perf:236: sub-make] Error 2
> > Command exited with non-zero status 2
> >
> > To be clear this is a native build of perf on a PPC64le host using this
> > command line:
> >
> > make -C tools/perf -f Makefile.perf -s -O -j60 O=3D../perf EXTRA_CFLAGS=
=3D-Wno-psabi
> >
> > (I could probably remove the EXTRA_CLFAGS now that I am building with
> > gcc 12.2)
> >
> > I don't know which commit caused this.
> >
> > I have used the perf tree from next-20230316 for today.
>
> I am still getting this build failure.

Hi Stephen,

The build failure is intentional as not having BPF skeleton support in
the perf tool will remove features. I've just sent:
https://lore.kernel.org/lkml/20230322183108.1380882-1-irogers@google.com/
Which will recommend adding NO_BPF_SKEL=3D1 to your build options when
this failure occurs. I didn't think a features test was appropriate
for this as the feature test would basically replicate the vmlinux.h
generation and I didn't want to move that support through the build
system.

Thanks,
Ian

> --
> Cheers,
> Stephen Rothwell
