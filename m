Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C9135111C
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 10:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbhDAIt0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Apr 2021 04:49:26 -0400
Received: from ozlabs.org ([203.11.71.1]:56083 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233626AbhDAItC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Apr 2021 04:49:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9xgH71P6z9sPf;
        Thu,  1 Apr 2021 19:48:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617266940;
        bh=wsBnL8set27d486n9ewIF/v885n8kFFSw1lbWyFLl3M=;
        h=Date:From:To:Cc:Subject:From;
        b=myEATeNz6M0avZTnmqwvBkJlpYOAb0n6ScHATarvkXc/4LEWb0U3kwFny8MPvDUML
         4a/fhyPcAyCOLp+rL+7Gi34h+9Flq2dA5KpB+b0Igx45tiD1dt09K/SkcySPSogFzM
         snbqPA6/UEflViMIAxI3HMhzcLyz1WRfDZNtSA9eAz9MjLJl5yCDZdZkrDTbwakOoz
         F3lWYliJoYYJk8aLeT/GQWeh6CrasDpHHmKK7rc+E+NbbhTs98vYzvwO4nPTyoV3tf
         tjxUtB+uT9YHGG2Z9HpBI9BaLhKWllX5DOcn2TWJIs/Y+8T+dKHW/5OI19L9viHuHd
         tIwuqc8EQ3a2Q==
Date:   Thu, 1 Apr 2021 19:48:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rander Wang <rander.wang@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the soundwire tree
Message-ID: <20210401194859.096aab67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R2o03fqLvUFxiZ1kKi6Z_Kd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R2o03fqLvUFxiZ1kKi6Z_Kd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  187c59cdcfe9 ("soundwire: stream: fix memory leak in stream config error =
path")

Fixes tag

  Fixes: bbe7379d8040a ("soundwire: Add support for SoundWire stream manage=
ment")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Did you mean

Fixes: bbe7379d8040 ("soundwire: Add support for port management")

or

Fixes: 89e590535f32 ("soundwire: Add support for SoundWire stream managemen=
t")

--=20
Cheers,
Stephen Rothwell

--Sig_/R2o03fqLvUFxiZ1kKi6Z_Kd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBliPsACgkQAVBC80lX
0Gw/BAf/eZZS4SDos0ztMwNYWszdbJSFGbG4+cfWpbLUKD2UCoKAZZ5KXdweBvNA
gBzROe8L2iYJScbNirHriWPHhtoZQlZaayjkVEx79eRP9lRkLZMQ8bGRErI4csO2
FhwVzZuozSXcuPyfkL8Q18GAoDCNlh7cxhBO81IJmvTx0f59Ylidl6/V2CIq9ZZJ
TIosuwry/CZ7H2RdTlbq1km3sO65c0ziWeKFpO0RbWDx4lslEPfGuI5vuUJTB2qo
UOXV2SoOQQNxygOAvZET5EY+ylWniIR7fdhXijzAn3H7EORmN+h6B5OSmwxb52nw
X6qgFdiVpC9XcQVRXx4/eRgQohd7eg==
=QrYE
-----END PGP SIGNATURE-----

--Sig_/R2o03fqLvUFxiZ1kKi6Z_Kd--
