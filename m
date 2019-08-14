Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C15AC8C5C0
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 04:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfHNCBV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 22:01:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40639 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfHNCBV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 22:01:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 467Xqx58cyz9sP8;
        Wed, 14 Aug 2019 12:01:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565748078;
        bh=e2nkYYq6Zq5d2uClkqO0wjWirioLnmBJr/FHSnA5vBU=;
        h=Date:From:To:Cc:Subject:From;
        b=ivJ+lZc4dP8lOWFiI4tGLU9KOJ2WXKizgsTMGEf5D/xHYobrJ7V8Fkf4uYOAFAIzR
         kiaZ5EdDUTqpRNTb9pahWg2DEZLgNz/QydvuvLHvOhmu1M9waR/M0vJhuLyGsOfe7B
         ObYbMNAWQeowyWdqhZetaPH+QEF1YSscOGTljcYVzQZCC3YKsizRKc+r568Wybpwo7
         k91U/mIlppiyC8nJLgTxwu8o+Y9Bav/afjq6CqDd9E92DDaRA2KFyDxrvCgXS26xV2
         SjNDomdWZclP5KaKMGmheVerNDL6Y3wsqo5DjLDVS1GQ5xaAPlBHqqRiO5FfxbJeo+
         27RUB9t+A7AUw==
Date:   Wed, 14 Aug 2019 12:01:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pablo Neira Ayuso <pablo@netfilter.org>,
        NetFilter <netfilter-devel@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeremy Sowden <jeremy@azazel.net>
Subject: linux-next: build warnings after merge of the netfilter-next tree
Message-ID: <20190814120110.3c17ddec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//VAFaF+b02F0AzB+9QlMd5h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//VAFaF+b02F0AzB+9QlMd5h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the netfilter-next tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

In file included from <command-line>:
include/uapi/linux/netfilter_ipv6/ip6t_LOG.h:5:2: warning: #warning "Please=
 update iptables, this file will be removed soon!" [-Wcpp]
 #warning "Please update iptables, this file will be removed soon!"
  ^~~~~~~
In file included from <command-line>:
include/uapi/linux/netfilter_ipv4/ipt_LOG.h:5:2: warning: #warning "Please =
update iptables, this file will be removed soon!" [-Wcpp]
 #warning "Please update iptables, this file will be removed soon!"
  ^~~~~~~

Introduced by commit

  2a475c409fe8 ("kbuild: remove all netfilter headers from header-test blac=
klist.")

--=20
Cheers,
Stephen Rothwell

--Sig_//VAFaF+b02F0AzB+9QlMd5h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Ta2YACgkQAVBC80lX
0GxcTgf/adyYODk8/1pjyxD0WSdoSVJWS9BkQ2vM9cIgzCgCgxOAWvPXDUY5Ca6V
WBBWPTy26zVMT9I5LUarGRTymeeMOY84lvkol5l9CWKe/k34yNTVwvrH/4j1XoC+
UOKUqHrFNG4ENIz2ZYMfe7Ej6AErg7G4vvSL4ALX0GhmO8tuz4HER9JrHKkaOgCZ
TF7/rIjq18CsV0hECH+zkfYQM9k376CKYyVQe4kG5jav0Hn1F6Xe6DkzDqG5Jyq/
q0oE08tqBxOiDgUFX78Wgk+F675+zAfJSMio6x4l507zIDZsE0JDlXedHPQNTsjs
D2n2ZeMROzmDvKWuAqvG9svN9lb6pA==
=fckG
-----END PGP SIGNATURE-----

--Sig_//VAFaF+b02F0AzB+9QlMd5h--
