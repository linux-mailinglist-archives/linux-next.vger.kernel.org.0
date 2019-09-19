Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B86B7881
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 13:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389874AbfISLbJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 07:31:09 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59188 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389849AbfISLbJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 07:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WtXZHsJGvu4bWl1ePQybzvrW/OfxAqdqaHQn3V7Ss8U=; b=pJkaZmASbMIUAxrxZG2kscwAC
        Yy+rCJ6GAxAL60xSAmmBGmxnzENXIpUtuDexzqb38IUcfwzoS5vjIX6eI3atYJfN7yrXSbY0lFXRN
        q01ZwqJeYb08eDVREhWrqPwwuyhaeLOWvA0zBYQaMG411FAGHYY5z/JxqjRPZybjBjN90=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAueR-0002Is-7Z; Thu, 19 Sep 2019 11:31:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 448552742939; Thu, 19 Sep 2019 12:31:06 +0100 (BST)
Date:   Thu, 19 Sep 2019 12:31:06 +0100
From:   Mark Brown <broonie@kernel.org>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Message-ID: <20190919113106.GC3642@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the btrfs-kdave tree got conflicts in:

  fs/btrfs/block-group.c
  fs/btrfs/ctree.h
  fs/btrfs/extent-tree.c
  fs/btrfs/send.c
  fs/btrfs/space-info.c
  include/uapi/linux/btrfs_tree.h

between a number of commits in Linus' tree and a number of commits in
the btrfs-kdave tree.  I don't feel comfortable that I can resolve these
safely and the btrfs-kdave tree hasn't changed since August with the
last non-merge commit in June so I've dropped the tree for today.

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DZvkACgkQJNaLcl1U
h9BuHgf8D4zhKRg3HIRAc0Az3qB+CGTRrROkYlLwVXKk24lMbV6I+cjI0gQhBQ5o
4YEtdG+skW5LUHYqVH9UmRhjk7UVpaeURhqWXpMlpcEckdHkt4sPVkCW2bFJ7PHo
uBKjYskRRBjaBiOmbV2+0dTpRlXp3LlZZR3jIKVp7Hh03pblYY8zcvgUM3+eaYXJ
O+9J4A1GlVgeIqxEkzfeS/HrQwZOTkAY1HFb0YEn//TclR2NcxHHmuSjh3FQKFz1
VWzv0GAqMIXgHBEYKMrZHrgFLumPO9Rn9HdJ090XUWMxy3vFK+fm+Ed7tZMzxdte
CNIy+Ovqi42BQMgsHxHmEAbwDjCW3Q==
=kYTH
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
