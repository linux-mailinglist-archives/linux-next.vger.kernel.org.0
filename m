Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D489C964
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 08:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729314AbfHZGYg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 02:24:36 -0400
Received: from ozlabs.org ([203.11.71.1]:51765 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbfHZGYg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 02:24:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46H2696BF2z9sMr;
        Mon, 26 Aug 2019 16:24:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566800673;
        bh=RCD1EV48x1Kicsb4dw/ssvZwRB/JX7tsrjqIRaYXYCs=;
        h=Date:From:To:Cc:Subject:From;
        b=Pzt8lI2M+itrsUh78QNTSXipNkDwH6JgLQmPrfWH/CsHV0gtbhLZx+Mz8Scqo+tl0
         ssGF86c7pJ1PxDrYPOl/hGwvaOGZYZeeQMtqadhAjCj+FJ0PxzCETtrcjPDdnd0SXe
         IVYnKUizA64qCsjAGbrEA/FE4opCpPrnofI1V2b49UEejjOV3YkfYw19aH68W7H1nB
         lZV7Yc7f/kGZgmcbXea0acrpgdSgjWsBVlSld2qM8GgHUbiTV7UetALD38uCgZH9av
         iI3CS2dok1/E8QEIOPCgtHI0fwRtxEXR2uMBJQSXDhIRggjmvZf1susdGw3FYnLSit
         xkXq7zt/Z2XOA==
Date:   Mon, 26 Aug 2019 16:24:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gao Xiang <hsiangkao@aol.com>
Subject: linux-next: build warning after merge of the staging tree
Message-ID: <20190826162432.11100665@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/715RiuNkX.D8Z1FGn/mV+yH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/715RiuNkX.D8Z1FGn/mV+yH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/trace/events/erofs.h:8,
                 from <command-line>:
include/trace/events/erofs.h:28:37: warning: 'struct dentry' declared insid=
e parameter list will not be visible outside of this definition or declarat=
ion
  TP_PROTO(struct inode *dir, struct dentry *dentry, unsigned int flags),
                                     ^~~~~~
include/linux/tracepoint.h:233:34: note: in definition of macro '__DECLARE_=
TRACE'
  static inline void trace_##name(proto)    \
                                  ^~~~~
include/linux/tracepoint.h:396:24: note: in expansion of macro 'PARAMS'
  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
                        ^~~~~~
include/linux/tracepoint.h:532:2: note: in expansion of macro 'DECLARE_TRAC=
E'
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
  ^~~~~~~~~~~~~
include/linux/tracepoint.h:532:22: note: in expansion of macro 'PARAMS'
  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                      ^~~~~~
include/trace/events/erofs.h:26:1: note: in expansion of macro 'TRACE_EVENT'
 TRACE_EVENT(erofs_lookup,
 ^~~~~~~~~~~
include/trace/events/erofs.h:28:2: note: in expansion of macro 'TP_PROTO'
  TP_PROTO(struct inode *dir, struct dentry *dentry, unsigned int flags),
  ^~~~~~~~

and moany more like this ...

Introduced by commit

  47e4937a4a7c ("erofs: move erofs out of staging")

(or, at least, exposed by it).  It needs, at least, a "struct dentry;"
added to the file.

--=20
Cheers,
Stephen Rothwell

--Sig_/715RiuNkX.D8Z1FGn/mV+yH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1jeyAACgkQAVBC80lX
0Gy2qgf+PtoSC+6jAOxO6Eq66/71Txu8WuVZVJlc+HLWvVx6pxfSvZgsPrrH1jQm
8gfO3HNinUKYJbFV/A3qLs4TFrTcHzGxfzeziPksYfcglCFG74Ie6zXGjo501yfJ
aIJc1vOb8f47hNS4ePRztO3q/bpDG5Jg03mfGIU9fugmxY7HKbwmsSRaJAN4kU3f
6teDjjqqUzfuG7vZf1fOMYm9ipMQHEX4vrdzxwd5qCfPXWALDBsAr4Bc8NRY9RST
LLRwW2drPLhoGxluTMPa8fT8cHGgbyCuwE0Ogr96SuMibOtovZKBLXfCHruKzEQe
Y6gkHy85TaWdrYyzc0pQ5MXgxDlGwg==
=K3zZ
-----END PGP SIGNATURE-----

--Sig_/715RiuNkX.D8Z1FGn/mV+yH--
