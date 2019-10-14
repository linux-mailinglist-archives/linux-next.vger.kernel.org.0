Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64919D6BEE
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 01:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfJNXJG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Oct 2019 19:09:06 -0400
Received: from ozlabs.org ([203.11.71.1]:46183 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726170AbfJNXJG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Oct 2019 19:09:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46sZ4b0JK8z9sPV;
        Tue, 15 Oct 2019 10:09:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571094543;
        bh=u/dXI8AwEBZADrfmz2niVNGP6gEFP31G6XIAvYsWouo=;
        h=Date:From:To:Cc:Subject:From;
        b=ZJEoBDH2s3GcDAJn7sYSyIqnMdpQZEa0l7SFCeGEGJZoCYJtppi2JpFtV2SaLMoG+
         /wjx7tMXVeS3+jYZ7zon9od4qe2HcomMSKGE/tP6oyYQMt2HbrvPht5amqLZ9ASdXq
         b81rzr7Iis5nW9M5WvrwKZ1OXVZr0D1xO1wBqlzFka02oEr9i9MGEZ+770SccjM+qQ
         Qkd1piSN4yi+3enP69IER3o5T/nQcWz9ol25+TfN9Pr+7jGbVPxguP+GusIpVmTzYT
         IMmrTUJue5TTqjeMSfeewMvodNJjzC+q5ggneOwMploEcQT24KiPU8I7wq0tGq/ghQ
         4zrL/D62GqaCA==
Date:   Tue, 15 Oct 2019 10:08:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: linux-next: build warning after merge of the pm tree
Message-ID: <20191015100855.31b8a3d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T0FbS7PjJzo5BfqZD96jO1M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T0FbS7PjJzo5BfqZD96jO1M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/irqchip.h:14,
                 from arch/arm/kernel/irq.c:26:
include/linux/acpi.h:682:31: warning: 'struct acpi_device' declared inside =
parameter list will not be visible outside of this definition or declaration
  682 | acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, =
const char *uid2)
      |                               ^~~~~~~~~~~

and many more.

Introduced by commit

  d1748b57dc88 ("ACPI / utils: Introduce acpi_dev_hid_uid_match() helper")

CONFIG_ACPI is not set for this build.

--=20
Cheers,
Stephen Rothwell

--Sig_/T0FbS7PjJzo5BfqZD96jO1M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2lAAcACgkQAVBC80lX
0Gy47wf+NqYnT7/lynuFZyKNLfbY4xs3ByX2qqG6hVDOE964c1fwBKiesBk0tMNZ
dMTUi2KTqejAVraLuJCA0/m4EEWaaGd3KMNfqiqms2sAgXm2C1j1FJ8qPUIZAhAL
BjsrLG/qTI6KGE9qIYw9cV6rE+GsXHmkDKpIC8uZyqyso0OaQdJ8QQuY/ieXF3QW
WmU+9RkDB/HX8bjuCUwLBH8ALCXD9RYolJ971JmypJiB1IuRQ4yplP+0OWK+etWv
nQoRqFStt7n1nfTxI29R5/axiyI4l8hp7QduKGlpwcN6LiP1xheCy8fxkPLQudYo
RKUdG78ast8BknB4u5DGFRCLOaCmZg==
=YxH0
-----END PGP SIGNATURE-----

--Sig_/T0FbS7PjJzo5BfqZD96jO1M--
