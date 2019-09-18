Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1F2AB6725
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 17:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387484AbfIRPcy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Sep 2019 11:32:54 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54890 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729640AbfIRPcy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2019 11:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6fG+7cFY8qKmNTeE0/oK7OzO5e+bx/UyTCd8HlUszGk=; b=ZzuVXWgde4+duuEB1OGFxwXyL
        zT5zbMFJfP50QtwClsnUB+7Mvd48Bl4ixy1YiIPOVwLntpL1zltX+RHsgjOc6wv4dWoBgou8UMZZQ
        ScL36uk7mVmpeTbMJjtwoaDJXR5hAOJ8M/NEUgx79e2ESUepbiZtd4qtYE9t6vTQWxB6E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAbwI-0005tn-Oo; Wed, 18 Sep 2019 15:32:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id B53AB2742927; Wed, 18 Sep 2019 16:32:17 +0100 (BST)
Date:   Wed, 18 Sep 2019 16:32:17 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Steffen Maier <maier@linux.ibm.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Ming Lei <tom.leiming@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Ming Lei <ming.lei@redhat.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux SCSI List <linux-scsi@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        "open list:DEVICE-MAPPER (LVM)" <dm-devel@redhat.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Benjamin Block <bblock@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Hannes Reinecke <hare@suse.com>, Jens Axboe <axboe@kernel.dk>,
        "Ewan D . Milne" <emilne@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Mike Snitzer <snitzer@redhat.com>
Subject: Re: [PATCH 1/2] scsi: core: fix missing .cleanup_rq for SCSI hosts
 without request batching
Message-ID: <20190918153217.GN2596@sirena.co.uk>
References: <20190807144948.28265-1-maier@linux.ibm.com>
 <20190807144948.28265-2-maier@linux.ibm.com>
 <CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
 <yq136iccsbw.fsf@oracle.com>
 <bec80a65-9a8c-54a9-fe70-876fcbe3d592@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0NB0lE7sNnW8+0qW"
Content-Disposition: inline
In-Reply-To: <bec80a65-9a8c-54a9-fe70-876fcbe3d592@linux.ibm.com>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--0NB0lE7sNnW8+0qW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 05:09:50PM +0200, Steffen Maier wrote:
> On 8/8/19 4:18 AM, Martin K. Petersen wrote:

> > I'll set up an amalgamated for-next branch tomorrow.

> Martin, is it possible that you re-wrote your for-next and it now no longer
> contains a merged 5.4/scsi-postmerge with those fixes?
> At least I cannot find the fix code in next-20190917 and it fails again for me.

Well, there's no sign of a branch called postmerge in the SCSI history
recently and I've not run into any SCSI-related conflicts so...

--0NB0lE7sNnW8+0qW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CTgAACgkQJNaLcl1U
h9DyCQgAhI9PE5cah3tJXlfm2IgfE6DGqrY+ZgkKfYQRbESZUGGvH0C8ZHzfdF9s
ew1oLds2WQCiwXttdV/OQrmwkkHibCqk7ZruKQJpmIDN9CmRPnO1EHunK1UFVuli
YGsRLI1Lp/gzfAzbaoA7BihFFKukgTxrZYcH9SfERbpf/raKMrEB9HUbyFDeBBKN
btGkV2DjeLMwQxiwQLTNDZ8NQ9oUwkaX1kGOv3CilW2qDkueaghQnMpyw05kuddR
4F5rE8+vA4jHJssZOqsoUJiNFzc9lloTdKeUDd4tR0qgY/thaG+RA2OVgh1XR1x1
wYZjyEIwrB4FhNOMDMiIl6jcM6uoqw==
=63JF
-----END PGP SIGNATURE-----

--0NB0lE7sNnW8+0qW--
