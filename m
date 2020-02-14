Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F3E15F837
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2020 21:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387852AbgBNUvt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Feb 2020 15:51:49 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43005 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387970AbgBNUvp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Feb 2020 15:51:45 -0500
Received: by mail-oi1-f194.google.com with SMTP id j132so10695850oih.9
        for <linux-next@vger.kernel.org>; Fri, 14 Feb 2020 12:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OUZEy9409pppSXljzrVzSPjPdAQw80MGvX16nfBY0dg=;
        b=XC8kv3Wy0OyQoREJOWp1L8cEyQ1FThdUzVe8SxPcm6z+yNRZQ+w+96qmHNRFnE0zFg
         0hrWiuwrQwnBJGouFTTXBqkYyEhKJxCYJDtYNeEe9OWB3N1pVH0I00UjWuZYf2/Znysx
         SPzGijZ1p4bQOVDd742sL44fHmIGY83rZEZ2IxU9hePz7S6GslxhIsa+CXggRmpc3fmn
         /IDtI1izIrcvu5l6OVgLMW7UONPNSOyuf+GFqyD3aH8X8c4RM4ZrT35d2x1EPfZD/4g4
         KCBAVALHP9sq7Szy9JydAPABAeA6ts9S2QwivSYQFWXMO/vdM6Vhmxc63Y0/zub5qTZN
         5B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OUZEy9409pppSXljzrVzSPjPdAQw80MGvX16nfBY0dg=;
        b=uJXIPGlG8YbsVVDvH5sF4DEzpyGB8+mzxasfkuIBJnXYqEeEa4ORgoHouoFVTwwazV
         Vbo38HC8wTmZmFBy3vA9RFFgn3Z5gsGRNpENED9je2CfZBGdP8fG2UIMwq4LqBBcKwgh
         CnpjPdTbT6GrjVjQlXKNerFqZJPWqQc3O1DlF6fVNTwVCpgJuw2dKdKAnC1LqiYq1sTZ
         TT0ru0qz4hNgifJRUkBjbMUCuHEkL1+TyPen8GJPDkwIQrHNWe4RUFhxXWABne8XtweQ
         hWIZI7BnuSaIpIAIcEMMM5z9QSeYRDMnF4R4vF6Ikt+Hg4OiGUrZYGHB5KzZpHczYEzA
         aZEA==
X-Gm-Message-State: APjAAAXvSnMNC0WFeRZ81wva3MSdtnv51L2TId7rU/peD1711bU5AXPb
        UHzsMWGLvXfHOIComSiapURUhpcv+UIo7JjVQKWCHgTkhb0p+A==
X-Google-Smtp-Source: APXvYqzu3C9V7D+AKDrsqCeye+pwVxWPDK+1pbaapoGpynmu2dpDODFT4oXrbdidRtdJXmKi1nMiF5ljl7HP+schbaM=
X-Received: by 2002:a54:4086:: with SMTP id i6mr3197997oii.65.1581713504693;
 Fri, 14 Feb 2020 12:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20200214062647.A2Mb_X-mP%akpm@linux-foundation.org>
 <8e1e8f6e-0da1-e9e0-fa1b-bfd792256604@infradead.org> <7ff9e944-1c6c-f7c1-d812-e12817c7a317@oracle.com>
In-Reply-To: <7ff9e944-1c6c-f7c1-d812-e12817c7a317@oracle.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Fri, 14 Feb 2020 12:51:33 -0800
Message-ID: <CAHS8izMhJ-2Bf+BBtXothR9nsLz9A5jJiv_tVRKUb9DwLKiN3g@mail.gmail.com>
Subject: Re: mmotm 2020-02-13-22-26 uploaded (mm/hugetlb.c)
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
        "open list:FILESYSTEMS (VFS and infrastructure)" 
        <linux-fsdevel@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
        linux-next@vger.kernel.org, mhocko@suse.cz,
        mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
        Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 14, 2020 at 9:18 AM Mike Kravetz <mike.kravetz@oracle.com> wrot=
e:
>
> + Mina
>
> Andrew, you might want to remove those hugetlb cgroup patches from mmotm
> as they are not yet fully reviewed and have some build issues.
>
> --
> Mike Kravetz

Up to you guys but I just sent you a patch ("hugetlb: fix
CONFIG_CGROUP_HUGETLB ifdefs") that should fix this build issue.

>
> On 2/14/20 8:29 AM, Randy Dunlap wrote:
> > On 2/13/20 10:26 PM, Andrew Morton wrote:
> >> The mm-of-the-moment snapshot 2020-02-13-22-26 has been uploaded to
> >>
> >>    http://www.ozlabs.org/~akpm/mmotm/
> >>
> >> mmotm-readme.txt says
> >>
> >> README for mm-of-the-moment:
> >>
> >> http://www.ozlabs.org/~akpm/mmotm/
> >>
> >> This is a snapshot of my -mm patch queue.  Uploaded at random hopefull=
y
> >> more than once a week.
> >>
> >
> > on x86_64:
> >
> >   CC      mm/hugetlb.o
> > In file included from ../include/linux/kernel.h:15:0,
> >                  from ../include/linux/list.h:9,
> >                  from ../mm/hugetlb.c:6:
> > ../mm/hugetlb.c: In function =E2=80=98dump_resv_map=E2=80=99:
> > ../mm/hugetlb.c:301:30: error: =E2=80=98struct file_region=E2=80=99 has=
 no member named =E2=80=98reservation_counter=E2=80=99
> >           rg->from, rg->to, rg->reservation_counter, rg->css);
> >                               ^
> > ../include/linux/printk.h:304:33: note: in definition of macro =E2=80=
=98pr_err=E2=80=99
> >   printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
> >                                  ^~~~~~~~~~~
> > ../mm/hugetlb.c:301:55: error: =E2=80=98struct file_region=E2=80=99 has=
 no member named =E2=80=98css=E2=80=99
> >           rg->from, rg->to, rg->reservation_counter, rg->css);
> >                                                        ^
> > ../include/linux/printk.h:304:33: note: in definition of macro =E2=80=
=98pr_err=E2=80=99
> >   printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
> >                                  ^~~~~~~~~~~
> > ../mm/hugetlb.c: In function =E2=80=98check_coalesce_bug=E2=80=99:
> > ../mm/hugetlb.c:320:10: error: =E2=80=98struct file_region=E2=80=99 has=
 no member named =E2=80=98reservation_counter=E2=80=99
> >    if (nrg->reservation_counter && nrg->from =3D=3D rg->to &&
> >           ^~
> > ../mm/hugetlb.c:321:10: error: =E2=80=98struct file_region=E2=80=99 has=
 no member named =E2=80=98reservation_counter=E2=80=99
> >        nrg->reservation_counter =3D=3D rg->reservation_counter &&
> >           ^~
> > ../mm/hugetlb.c:321:37: error: =E2=80=98struct file_region=E2=80=99 has=
 no member named =E2=80=98reservation_counter=E2=80=99
> >        nrg->reservation_counter =3D=3D rg->reservation_counter &&
> >                                      ^~
> > ../mm/hugetlb.c:322:10: error: =E2=80=98struct file_region=E2=80=99 has=
 no member named =E2=80=98css=E2=80=99
> >        nrg->css =3D=3D rg->css) {
> >           ^~
> > ../mm/hugetlb.c:322:21: error: =E2=80=98struct file_region=E2=80=99 has=
 no member named =E2=80=98css=E2=80=99
> >        nrg->css =3D=3D rg->css) {
> >                      ^~
> >
> >
> > Full randconfig file is attached.
> >
