Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A0F36145C
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 23:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236247AbhDOVwQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 17:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234866AbhDOVwP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Apr 2021 17:52:15 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA84EC061574;
        Thu, 15 Apr 2021 14:51:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLtMy1FzZz9sV5;
        Fri, 16 Apr 2021 07:51:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618523502;
        bh=XMmGtBGt/E/Mqrfx2tRr0oZSYnq8pEEEm6oDs936Pto=;
        h=Date:From:To:Cc:Subject:From;
        b=Dst4ADLVgQtoP88y6NgWfxWNu4x+xUkBv/x8Slay8UbQldyV6JMA8XfCc42+u0JrM
         ocU9NEIpgOvSmzw4BnuPOMrSpjfuBIV9jSyvueTSOHD6vx78MdnbvK/7O2oj4Xbuw5
         z8+1K7vNd6INwBJJY1C0EKlyrg4W+9jVjlkW9HBHqq/o6BtLMm5pvZbeh1bKdPR7No
         5iXwlK1WBV/g8kMQRrExa3yW3fWOGb26THAuUT3yJ0rym/uWA9kqOzsTyATyW3kmnW
         XHS8ohv4r12ZIxlu5XAFMaSX4nGuISIAZDR/ayT0sC7y55QQrsxew9CV9tUY69QDQ7
         qX8pfIIS2PRoQ==
Date:   Fri, 16 Apr 2021 07:51:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the iommu tree
Message-ID: <20210416075141.0b3a4e6e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+ahpKIWzN=eEOSj8Jdfk70a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+ahpKIWzN=eEOSj8Jdfk70a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  af5247b169a0 ("iommu/mediatek: Always enable the clk on resume")

Fixes tag

  Fixes: commit c0b57581b73b ("iommu/mediatek: Add power-domain operation")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/+ahpKIWzN=eEOSj8Jdfk70a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB4tW0ACgkQAVBC80lX
0Gxoswf/TPdj2GalQhEJi8XoZof5dY6roo5O9ECwYMZygLl51BeQU/3Jl6mccmZO
/vja+g5JBMX6GMgcg13i6CUQm0X0dMDfTJwevJZ2RUTip1etW7lDqmpJhBVW6tej
RV7TflVkTAu9cgs/3L3g2ZAmEC79OpTJuK0jFrLBGusVJrl9zfG6+QgLCb420mOZ
U9dqD7Dr7OzP3vAk+YXBCt60FjyjQXJFTfscYxWOpN05aUwWHaQb5moHVamVNuKl
ZvnLbcyTdn13/HeR7Qox+OzNzLG1kH0r1XnDcFp/sGhqpXUkpTPvQK2uOZgRlaEs
mPBU1HOk9BwqkLfsMQo2Qz0FQn0Ohg==
=AFw7
-----END PGP SIGNATURE-----

--Sig_/+ahpKIWzN=eEOSj8Jdfk70a--
