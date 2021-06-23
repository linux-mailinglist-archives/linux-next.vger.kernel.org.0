Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F221A3B1392
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 07:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFWGBM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 02:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhFWGBM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 02:01:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC146C061574;
        Tue, 22 Jun 2021 22:58:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8syh4JX2z9sVm;
        Wed, 23 Jun 2021 15:58:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624427933;
        bh=siE4tx1biqrCwjCyQ1Xcq/VGKY7KaoEOfWxTZZue4IQ=;
        h=Date:From:To:Cc:Subject:From;
        b=EJg/p2sbAiXpneiBgnYXlw1+Nk9H8OygSOYoC7YU84pZvVIfJ5uxFHaXwAoMvF9IY
         aWvoWTx5pmrkhi+KfqllBBWwB4RO07OZP7KKGl7K/Il7lT35Qypep0l4F+9mjTzgju
         JDTOKnE+SkLvCLutjCCjpcX3a0mg3dMd0EBzJ1XVkhqEZ+tQdwgYpK0IMCN9kFkRwy
         9CAAcg2YKuS4MCCFi5E3IdOkVHsuEUcghXo9U5Bqo/gTQlXEkyoS/ciNd894J03O6x
         Jnj06K4I8FsY6hrxlGe8bYjpHnOu1uHO89PkGEg1QSwZ8DrnnCS6Y6h0w/xKCWd/9h
         Q2LTQXtlwhAng==
Date:   Wed, 23 Jun 2021 15:58:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Steven Price <steven.price@arm.com>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20210623155851.2db598e7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4z.MafC/9hEqCSY8UburFXh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4z.MafC/9hEqCSY8UburFXh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/mte.h

between commit:

  013bb59dbb7c ("arm64: mte: handle tags zeroing at page allocation time")

from the arm64 tree and commit:

  69e3b846d8a7 ("arm64: mte: Sync tags for pages where PTE is untagged")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/mte.h
index 67bf259ae768,347ef38a35f7..000000000000
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@@ -37,8 -37,7 +37,8 @@@ void mte_free_tag_storage(char *storage
  /* track which pages have valid allocation tags */
  #define PG_mte_tagged	PG_arch_2
 =20
 +void mte_zero_clear_page_tags(void *addr);
- void mte_sync_tags(pte_t *ptep, pte_t pte);
+ void mte_sync_tags(pte_t old_pte, pte_t pte);
  void mte_copy_page_tags(void *kto, const void *kfrom);
  void mte_thread_init_user(void);
  void mte_thread_switch(struct task_struct *next);
@@@ -54,10 -53,7 +54,10 @@@ int mte_ptrace_copy_tags(struct task_st
  /* unused if !CONFIG_ARM64_MTE, silence the compiler */
  #define PG_mte_tagged	0
 =20
 +static inline void mte_zero_clear_page_tags(void *addr)
 +{
 +}
- static inline void mte_sync_tags(pte_t *ptep, pte_t pte)
+ static inline void mte_sync_tags(pte_t old_pte, pte_t pte)
  {
  }
  static inline void mte_copy_page_tags(void *kto, const void *kfrom)

--Sig_/4z.MafC/9hEqCSY8UburFXh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDSzZsACgkQAVBC80lX
0GyJCwf5ASRxr/1g6JvYVjY/sASFdo2hNDb8D3hZoqdd5zD02QNh8WbocIYMuST7
3PfMwv/XWL8nW4j9fp926SWke7C/gkXTJb+067hNwI+6/mV95v5QMTzhKyzmaLYU
p1Zqb7dZBJLpQ0mV/+Wzwn5si3ywfk7c0gAH6m8V2/uJxnnc/kh+rtj1nBkVGj0Z
DP3Aflh7s7eU5UWPvjNK0VlQExUbMNoUPR9GRsEtPhS/9yKb4Oo7ngobk4sdRXUv
LEoupHhulBIkEzYVDT4zZ+SGVBvR8pWQqwvLiYOOpVIIzouQ+/8Fjoq1Sb0YxhLU
Ila0Emp+lelztfnmA8Vd207J6hPP/Q==
=CJqE
-----END PGP SIGNATURE-----

--Sig_/4z.MafC/9hEqCSY8UburFXh--
