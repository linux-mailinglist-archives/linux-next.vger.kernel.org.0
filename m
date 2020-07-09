Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED8C7219D21
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 12:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgGIKMF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 06:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgGIKMD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jul 2020 06:12:03 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9DBC08C5CE
        for <linux-next@vger.kernel.org>; Thu,  9 Jul 2020 03:12:02 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z24so1727932ljn.8
        for <linux-next@vger.kernel.org>; Thu, 09 Jul 2020 03:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F5zNt+/8MBcTXKU9z4OwwwuHVh/xb7W+PbDlLB2EagE=;
        b=iFvTtZ48V/yaOIEbYkXdI0HKKlz6RCzGER6BnahE31Yn/db0impJzhrBzVIYRm/3L3
         1agPr01Fh1YgtAL4IFgTN7lthuktGbSwocZGrnI9TfHagClLILGiUWb0H4rCXUXQWfOI
         AzdYq4Uqv/mvGkSa9tRa9ngaGfqR2qTVDZhPuTF1WUQkGDmhr3hXc2IXx+t+IelZPuQF
         oDPINYknsUZDCcadQjLwV+7Cx8tvgAiWrJhK9utwtzfhbdAkshiW1W4++jQ0lVt9g90l
         hHdoTdrqK2qGwXtUDGGRVavACPUZAFImlpNq4GGKjJuzd7f0SQx2iyXD4wVV+tQKRFoo
         0Ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F5zNt+/8MBcTXKU9z4OwwwuHVh/xb7W+PbDlLB2EagE=;
        b=a5KRtOsvorYtGhsT7OnnD9XaQ1CFXMV4HIcLyJHvnE8NUz/Rmu0lxWqgZZWx8wfcvZ
         3Hfm4IWSRknUKGvs0HjxkliLfwCqnQO5e7DN+4GibmYQnpQY7F9hPeZFxQpz+4nCG6p3
         L+qI26Bpnr21JtJmd9HXPXg9DnjETRrNHVOrhU6dk02EtcK30+4Wo4APsuvAD6DKl+ny
         lHmSuG0TSyJlQzsem/2iSIXFCLZngNK5GggqqnrEy6YP1UTRsbV6+5tV0mOe8D7BWJ+x
         McxoQm7KxVbaCDL8AIwiuuoTKEa51LYp+Y+e65kf+mdcl3/gscMROKdhv6uPALY4vv67
         nKNA==
X-Gm-Message-State: AOAM531AlrvfP8Qs/A3Ju8B+pUNga0N8RPEtccWzZI/giN4n9XpzYlEW
        QxJ/I8Rg+JlcJg0c/dIJVk0Qpnwwv1pR1+tV7VGO9Q==
X-Google-Smtp-Source: ABdhPJzj6Diqwvs3reLM3+wt1t1+EMyEMuQNIhfCqqpVzpgUnEoOweySkXy2zZXnJ54IFhejXlWS8FRlHGEryjWdjFk=
X-Received: by 2002:a2e:8992:: with SMTP id c18mr28126507lji.388.1594289520704;
 Thu, 09 Jul 2020 03:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200709191818.338158f4@canb.auug.org.au>
In-Reply-To: <20200709191818.338158f4@canb.auug.org.au>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Thu, 9 Jul 2020 12:11:49 +0200
Message-ID: <CADYN=9KMqfsh1P1suS=UN=3B+RkwQ65iCa=tbugQAwaL6Jc=eg@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 9
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 9 Jul 2020 at 11:18, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Changes since 20200708:
>
> My fixes tree contains:
>
>   dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")
>   b236d81d9e4f ("powerpc/boot/dts: Fix dtc "pciex" warnings")
>
> The kbuild tree still had its build failure for which I reverted a commit=
.
>
> The scmi tree gained a build failure so I used the version from
> next-20200708;
>
> The net-next tree gained a conflict against the pci tree.
>
> The block tree gained conflicts against the btrfs and fscrypt trees.
>
> The device-mapper tree gained a conflict against the block tree.
>
> The security tree still had its build failure for which I applied a patch=
.
>
> The tip tree still had one build failure for which I reverted a commit.
>
> The akpm-current tree gained a conflict against the userns tree and a
> build failure for which I reverted 2 commits.
>
> The akpm tree lost a patch that turned up elsewhere.
>
> Non-merge commits (relative to Linus' tree): 5915
>  6780 files changed, 362395 insertions(+), 141614 deletions(-)
>

Today's tag doesn't build on arm64.
I think this patch e76b573f11d1 ("arm64: mte: Add
PTRACE_{PEEK,POKE}MTETAGS support")
broke the build due to this patch was included also
dc766e66c2b3 ("mm/gup: remove task_struct pointer for all gup code")...

/srv/src/kernel/next/arch/arm64/kernel/mte.c: In function
=E2=80=98__access_remote_tags=E2=80=99:
/srv/src/kernel/next/arch/arm64/kernel/mte.c:224:31: error: passing
argument 1 of =E2=80=98get_user_pages_remote=E2=80=99 from incompatible poi=
nter type
[-Werror=3Dincompatible-pointer-types]
  224 |   ret =3D get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
      |                               ^~~
      |                               |
      |                               struct task_struct *
In file included from /srv/src/kernel/next/arch/arm64/kernel/mte.c:8:
/srv/src/kernel/next/include/linux/mm.h:1707:46: note: expected
=E2=80=98struct mm_struct *=E2=80=99 but argument is of type =E2=80=98struc=
t task_struct *=E2=80=99
 1707 | long get_user_pages_remote(struct mm_struct *mm,
      |                            ~~~~~~~~~~~~~~~~~~^~
/srv/src/kernel/next/arch/arm64/kernel/mte.c:224:36: warning: passing
argument 2 of =E2=80=98get_user_pages_remote=E2=80=99 makes integer from po=
inter
without a cast [-Wint-conversion]
  224 |   ret =3D get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
      |                                    ^~
      |                                    |
      |                                    struct mm_struct *
In file included from /srv/src/kernel/next/arch/arm64/kernel/mte.c:8:
/srv/src/kernel/next/include/linux/mm.h:1708:22: note: expected =E2=80=98lo=
ng
unsigned int=E2=80=99 but argument is of type =E2=80=98struct mm_struct *=
=E2=80=99
 1708 |        unsigned long start, unsigned long nr_pages,
      |        ~~~~~~~~~~~~~~^~~~~
/srv/src/kernel/next/arch/arm64/kernel/mte.c:224:49: warning: passing
argument 5 of =E2=80=98get_user_pages_remote=E2=80=99 makes pointer from in=
teger
without a cast [-Wint-conversion]
  224 |   ret =3D get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
      |                                                 ^~~~~~~~~
      |                                                 |
      |                                                 unsigned int
In file included from /srv/src/kernel/next/arch/arm64/kernel/mte.c:8:
/srv/src/kernel/next/include/linux/mm.h:1709:46: note: expected
=E2=80=98struct page **=E2=80=99 but argument is of type =E2=80=98unsigned =
int=E2=80=99
 1709 |        unsigned int gup_flags, struct page **pages,
      |                                ~~~~~~~~~~~~~~^~~~~
/srv/src/kernel/next/arch/arm64/kernel/mte.c:225:10: error: passing
argument 6 of =E2=80=98get_user_pages_remote=E2=80=99 from incompatible poi=
nter type
[-Werror=3Dincompatible-pointer-types]
  225 |          &page, &vma, NULL);
      |          ^~~~~
      |          |
      |          struct page **
In file included from /srv/src/kernel/next/arch/arm64/kernel/mte.c:8:
/srv/src/kernel/next/include/linux/mm.h:1710:32: note: expected
=E2=80=98struct vm_area_struct **=E2=80=99 but argument is of type =E2=80=
=98struct page **=E2=80=99
 1710 |        struct vm_area_struct **vmas, int *locked);
      |        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
/srv/src/kernel/next/arch/arm64/kernel/mte.c:225:17: error: passing
argument 7 of =E2=80=98get_user_pages_remote=E2=80=99 from incompatible poi=
nter type
[-Werror=3Dincompatible-pointer-types]
  225 |          &page, &vma, NULL);
      |                 ^~~~
      |                 |
      |                 struct vm_area_struct **
In file included from /srv/src/kernel/next/arch/arm64/kernel/mte.c:8:
/srv/src/kernel/next/include/linux/mm.h:1710:43: note: expected =E2=80=98in=
t
*=E2=80=99 but argument is of type =E2=80=98struct vm_area_struct **=E2=80=
=99
 1710 |        struct vm_area_struct **vmas, int *locked);
      |                                      ~~~~~^~~~~~
/srv/src/kernel/next/arch/arm64/kernel/mte.c:224:9: error: too many
arguments to function =E2=80=98get_user_pages_remote=E2=80=99
  224 |   ret =3D get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
      |         ^~~~~~~~~~~~~~~~~~~~~
In file included from /srv/src/kernel/next/arch/arm64/kernel/mte.c:8:
/srv/src/kernel/next/include/linux/mm.h:1707:6: note: declared here
 1707 | long get_user_pages_remote(struct mm_struct *mm,
      |      ^~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[3]: *** [/srv/src/kernel/next/scripts/Makefile.build:280:
arch/arm64/kernel/mte.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [/srv/src/kernel/next/scripts/Makefile.build:497:
arch/arm64/kernel] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/srv/src/kernel/next/Makefile:1764: arch/arm64] Error 2

This change made it build again:

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 934639ab225d..11e558b02a05 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -221,7 +221,7 @@ static int __access_remote_tags(struct task_struct
*tsk, struct mm_struct *mm,
  void *maddr;
  struct page *page =3D NULL;

- ret =3D get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
+ ret =3D get_user_pages_remote(mm, addr, 1, gup_flags,
     &page, &vma, NULL);
  if (ret <=3D 0)
  break;

Cheers,
Anders
