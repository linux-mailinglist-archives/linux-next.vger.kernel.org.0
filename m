Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAC22FD318
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 04:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfKODCQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 22:02:16 -0500
Received: from ozlabs.org ([203.11.71.1]:56489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726674AbfKODCQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 22:02:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DjnK72MNz9s7T;
        Fri, 15 Nov 2019 14:02:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573786934;
        bh=+Do3LMt64aaFPe5u9CjhUx9/Fe0XAXiSgZFtW2yysPE=;
        h=Date:From:To:Cc:Subject:From;
        b=ATCFqh3lU9ge8ZX3r20ORLy8jcKP4NmvwMRyCRYzAm7rMFspFC6FgtUXxwkOp7ybt
         7cKbfxyccnTe4j8BO3MILDtc65GYWsE4WwrHiU+sqLNg9fntpH4xOpMQ4r08raXBZL
         QW0W38sMnBh2uB/ch1F6R3XWwxkbvOO78rlsPIDwhcgDtBFIBkLUydofrKM77SeeFH
         9fwzju9V6wfTsyZaticmXc4WKoLQmiMpo8/O8yEDfA8S+RW/+1BHH+k4wbl9UlAk1X
         xruLpQrH8/wOj0K3PaElcGsEtkMVBY1SyziGx8V2dVxg9Vr3/FPIwi8m/ymsbHP+lE
         3U4vmfQ2BEyaA==
Date:   Fri, 15 Nov 2019 14:02:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Viktor Rosendahl (BMW)" <viktor.rosendahl@gmail.com>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20191115140213.74c5efe7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KPUy8ukgb6DKaKhfJTQCk7f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KPUy8ukgb6DKaKhfJTQCk7f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from kernel/trace/trace.c:52:
kernel/trace/trace.h:804:13: warning: 'latency_fsnotify' defined but not us=
ed [-Wunused-function]
  804 | static void latency_fsnotify(struct trace_array *tr) { }
      |             ^~~~~~~~~~~~~~~~

Introduced by commit

  91edde2e6ae1 ("ftrace: Implement fs notification for tracing_max_latency")

"inline" missing :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/KPUy8ukgb6DKaKhfJTQCk7f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3OFTUACgkQAVBC80lX
0GwO9gf7B2J2SvrvjVgDAcquhmXTqeUktEgzex77/SRNCjvyH50lBga88zAoaplY
gGZ2xzI86O1gjVgltZ2S9jWbjYxP4Yw+0XfIgEdKjXibF9WWIYFECuqN1KZjYsmA
fVEOXbs9OCr1SbOosEpcnAB6f4yisx1++7WFReoOmqZOumCY7l0OISkqq+L1XxcP
F8EKipBEh3yfLoTQTcgDmfUqy6z2OqE/qTeKzo+viHUg3mMLNu3byTfJn3uj6ba5
hGnXXc+6geApteq7pENa6odd+AeOceuh+/PK0hSDwC3LwLkNIuTlnRoSW6jkyIAE
cJ3VyMRbJRDWgxnrVnlHRZWs+jEdMg==
=zxO2
-----END PGP SIGNATURE-----

--Sig_/KPUy8ukgb6DKaKhfJTQCk7f--
