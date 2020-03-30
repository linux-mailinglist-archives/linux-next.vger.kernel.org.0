Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B222197454
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 08:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbgC3GTx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 02:19:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59819 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728065AbgC3GTx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 02:19:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rMkX6Ry5z9sPR;
        Mon, 30 Mar 2020 17:19:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585549189;
        bh=youvVChtR9IL3Dpx017uE23BYcG0U/z5LGCLd2eI52s=;
        h=Date:From:To:Cc:Subject:From;
        b=LMf3UoN99ABLYDuItnflVr/cL9E4En/U4r4xdkE/+8Klt6u7EolXpnJgxu3zo7cKb
         ul67Ucg1xGm+SWV9Bfp+6e8qsR+5DhL7dwijqN1j5sb9yTDT0gi2XoEoNuV+jXsRCr
         u1TfzbvQV515vAy8fVXNW0ABjOdWArgThh2d0fiR7CuglT4pj0D+O9OsfGckZ1mU+Z
         N1HR5o/JwfZT94snY9eAjv2yRrqAXjSqSA4u8zDbLF9YOgRweDAYk6QqjNAHDpLJn8
         zQyhVgijH52s3y8VPYWb6dymk6ljhNkEIKqAgkP7vknJ2QdJj/j7EwqVFgNF1tQTo/
         e884+0OesP/1g==
Date:   Mon, 30 Mar 2020 17:19:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20200330171946.4e48fbd9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SKML/+XaAwEn+W+i4JdedJ8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SKML/+XaAwEn+W+i4JdedJ8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pinctrl/qcom/pinctrl-msm.c:909:4: error: expected identifier or '('=
 before 'else'
  909 |  } else {
      |    ^~~~
drivers/pinctrl/qcom/pinctrl-msm.c:921:2: warning: data definition has no t=
ype or storage class
  921 |  val =3D msm_readl_intr_cfg(pctrl, g);
      |  ^~~
drivers/pinctrl/qcom/pinctrl-msm.c:921:2: error: type defaults to 'int' in =
declaration of 'val' [-Werror=3Dimplicit-int]
drivers/pinctrl/qcom/pinctrl-msm.c:921:27: error: 'pctrl' undeclared here (=
not in a function); did you mean 'pinctrl'?
  921 |  val =3D msm_readl_intr_cfg(pctrl, g);
      |                           ^~~~~
      |                           pinctrl
drivers/pinctrl/qcom/pinctrl-msm.c:921:34: error: 'g' undeclared here (not =
in a function)
  921 |  val =3D msm_readl_intr_cfg(pctrl, g);
      |                                  ^
drivers/pinctrl/qcom/pinctrl-msm.c:922:6: error: expected '=3D', ',', ';', =
'asm' or '__attribute__' before '|=3D' token
  922 |  val |=3D BIT(g->intr_raw_status_bit);
      |      ^~
drivers/pinctrl/qcom/pinctrl-msm.c:923:2: error: expected identifier or '('=
 before 'if'
  923 |  if (g->intr_detection_width =3D=3D 2) {
      |  ^~
drivers/pinctrl/qcom/pinctrl-msm.c:945:4: error: expected identifier or '('=
 before 'else'
  945 |  } else if (g->intr_detection_width =3D=3D 1) {
      |    ^~~~
drivers/pinctrl/qcom/pinctrl-msm.c:966:4: error: expected identifier or '('=
 before 'else'
  966 |  } else {
      |    ^~~~
drivers/pinctrl/qcom/pinctrl-msm.c:969:2: warning: data definition has no t=
ype or storage class
  969 |  msm_writel_intr_cfg(val, pctrl, g);
      |  ^~~~~~~~~~~~~~~~~~~
drivers/pinctrl/qcom/pinctrl-msm.c:969:2: error: type defaults to 'int' in =
declaration of 'msm_writel_intr_cfg' [-Werror=3Dimplicit-int]
drivers/pinctrl/qcom/pinctrl-msm.c:969:2: warning: parameter names (without=
 types) in function declaration
drivers/pinctrl/qcom/pinctrl-msm.c:969:2: error: conflicting types for 'msm=
_writel_intr_cfg'
drivers/pinctrl/qcom/pinctrl-msm.c:84:13: note: previous definition of 'msm=
_writel_intr_cfg' was here
   84 | static void msm_writel_##name(u32 val, struct msm_pinctrl *pctrl, \
      |             ^~~~~~~~~~~
drivers/pinctrl/qcom/pinctrl-msm.c:92:1: note: in expansion of macro 'MSM_A=
CCESSOR'
   92 | MSM_ACCESSOR(intr_cfg)
      | ^~~~~~~~~~~~
drivers/pinctrl/qcom/pinctrl-msm.c:971:2: error: expected identifier or '('=
 before 'if'
  971 |  if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
      |  ^~
In file included from include/linux/vmalloc.h:5,
                 from include/asm-generic/io.h:887,
                 from arch/arm/include/asm/io.h:438,
                 from include/linux/io.h:13,
                 from drivers/pinctrl/qcom/pinctrl-msm.c:9:
include/linux/spinlock.h:287:2: error: expected identifier or '(' before 'd=
o'
  287 |  do {       \
      |  ^~
drivers/pinctrl/qcom/pinctrl-msm.c:974:2: note: in expansion of macro 'raw_=
spin_unlock_irqrestore'
  974 |  raw_spin_unlock_irqrestore(&pctrl->lock, flags);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/spinlock.h:290:4: error: expected identifier or '(' before 'w=
hile'
  290 |  } while (0)
      |    ^~~~~
drivers/pinctrl/qcom/pinctrl-msm.c:974:2: note: in expansion of macro 'raw_=
spin_unlock_irqrestore'
  974 |  raw_spin_unlock_irqrestore(&pctrl->lock, flags);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/qcom/pinctrl-msm.c:976:2: error: expected identifier or '('=
 before 'if'
  976 |  if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
      |  ^~
drivers/pinctrl/qcom/pinctrl-msm.c:978:2: error: expected identifier or '('=
 before 'else'
  978 |  else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
      |  ^~~~
drivers/pinctrl/qcom/pinctrl-msm.c:981:2: error: expected identifier or '('=
 before 'return'
  981 |  return 0;
      |  ^~~~~~
drivers/pinctrl/qcom/pinctrl-msm.c:982:1: error: expected identifier or '('=
 before '}' token
  982 | }
      | ^
drivers/pinctrl/qcom/pinctrl-msm.c: In function 'msm_gpio_irq_set_type':
drivers/pinctrl/qcom/pinctrl-msm.c:909:2: warning: control reaches end of n=
on-void function [-Wreturn-type]
  909 |  } else {
      |  ^
At top level:
drivers/pinctrl/qcom/pinctrl-msm.c:84:13: warning: 'msm_writel_intr_target'=
 defined but not used [-Wunused-function]
   84 | static void msm_writel_##name(u32 val, struct msm_pinctrl *pctrl, \
      |             ^~~~~~~~~~~
drivers/pinctrl/qcom/pinctrl-msm.c:94:1: note: in expansion of macro 'MSM_A=
CCESSOR'
   94 | MSM_ACCESSOR(intr_target)
      | ^~~~~~~~~~~~
drivers/pinctrl/qcom/pinctrl-msm.c:79:12: warning: 'msm_readl_intr_target' =
defined but not used [-Wunused-function]
   79 | static u32 msm_readl_##name(struct msm_pinctrl *pctrl, \
      |            ^~~~~~~~~~
drivers/pinctrl/qcom/pinctrl-msm.c:94:1: note: in expansion of macro 'MSM_A=
CCESSOR'
   94 | MSM_ACCESSOR(intr_target)
      | ^~~~~~~~~~~~

Caused by commit

  13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/SKML/+XaAwEn+W+i4JdedJ8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Bj4IACgkQAVBC80lX
0Gx10Af8DE4exCuBT57lUHkd6GgIHeWGKoOZnmjkmSZTgpwMdntdkpKex+b6VuG5
e0zk5VTmtobmDRU8C84zLMoFeGjldDczJleXnWCJTdrT/5+8NqlgXTJaSgH1r0jH
rwmZKXOsS1Mvjsch7XgeDfGIpxe5hieJf8h/PPPL5RMqZXHEOFjVkEFSpgWMD8z1
Sifz5lNi5VMZZZVSdMIB2A88/JfHBHKvJk776TpwRtXFgcvVaYdiykfP/asb4tul
zdogrSA6Xxf9M8oKWbZKoIjyKY6UYhYORezM2QxGbqniXjkHQCGEbtXUw2/6svmD
sdG+wtbTmhZK2SdYZ4hpI0MNSXcs8w==
=F85x
-----END PGP SIGNATURE-----

--Sig_/SKML/+XaAwEn+W+i4JdedJ8--
