Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CABA4263CE
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 06:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233764AbhJHEb1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 00:31:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57961 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhJHEb1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 00:31:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQZwC1j3bz4xbC;
        Fri,  8 Oct 2021 15:29:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633667371;
        bh=yXC0vaStn68o7bMbPAe6bnZtRDDi1/bbLJEOIb0Pprg=;
        h=Date:From:To:Cc:Subject:From;
        b=N3UohN8FAPeo3YH5TDEwi1sAHo1yWt/gLK6XyHrlpY9Zbasc7DMtBpqccqtyh8vRr
         iSVkYWR0C4E1fKDn3WpvxLPYrdfIxM4GoY2Dh35+OShke+PcGB52fgoE0obDreWdwb
         MDFKMA2jv2xbh37j5IDiNQzUqQAnWwLQ7iMcpZL+bbxA06+EqzX6WlkRR+lTkFD+jM
         9JoYUgqIPWm1jJpUCOAtoYLJH6Sx+da8Fcz7Z+BBcQrWGE2Y5xndKf5GQtcYw/6Ix7
         P9kLiz29o78ctOHeIUEVEWAdcsjlJWYiJiknDMj3lnsWHtAsquChw1NpXcylUUETSM
         W/sOuiIn/Q5Gg==
Date:   Fri, 8 Oct 2021 15:29:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
Message-ID: <20211008152930.03787395@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vreASslLHYHFxDSelzvTor+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vreASslLHYHFxDSelzvTor+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kunit-next tree got a conflict in:

  tools/testing/kunit/kunit.py

between commit:

  d8c23ead708b ("kunit: tool: better handling of quasi-bool args (--json, -=
-raw_output)")

from the kunit-fixes tree and commit:

  6710951ee039 ("kunit: tool: support running each suite/test separately")

from the kunit-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/kunit/kunit.py
index ac35c61f65f5,7197e5fb8342..000000000000
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@@ -16,9 -17,8 +17,8 @@@ assert sys.version_info >=3D (3, 7), "Pyt
 =20
  from collections import namedtuple
  from enum import Enum, auto
- from typing import Iterable, Sequence
 -from typing import Iterable, List
++from typing import Iterable, Sequence, List
 =20
- import kunit_config
  import kunit_json
  import kunit_kernel
  import kunit_parser
@@@ -184,28 -231,8 +231,28 @@@ def run_tests(linux: kunit_kernel.Linux
  				config_result.elapsed_time,
  				build_result.elapsed_time,
  				exec_result.elapsed_time))
- 	return parse_result
+ 	return exec_result
 =20
 +# Problem:
 +# $ kunit.py run --json
 +# works as one would expect and prints the parsed test results as JSON.
 +# $ kunit.py run --json suite_name
 +# would *not* pass suite_name as the filter_glob and print as json.
 +# argparse will consider it to be another way of writing
 +# $ kunit.py run --json=3Dsuite_name
 +# i.e. it would run all tests, and dump the json to a `suite_name` file.
 +# So we hackily automatically rewrite --json =3D> --json=3Dstdout
 +pseudo_bool_flag_defaults =3D {
 +		'--json': 'stdout',
 +		'--raw_output': 'kunit',
 +}
 +def massage_argv(argv: Sequence[str]) -> Sequence[str]:
 +	def massage_arg(arg: str) -> str:
 +		if arg not in pseudo_bool_flag_defaults:
 +			return arg
 +		return  f'{arg}=3D{pseudo_bool_flag_defaults[arg]}'
 +	return list(map(massage_arg, argv))
 +
  def add_common_opts(parser) -> None:
  	parser.add_argument('--build_dir',
  			    help=3D'As in the make command, it specifies the build '

--Sig_/vreASslLHYHFxDSelzvTor+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFfySoACgkQAVBC80lX
0GzQIggAjEnAiw2+3/VtDs/AoGqrZnkxS2QAD2lcXfbhlBsjwCu4Lv+4exT+xSSr
pBg5jd7PtTk3kgIgg8EH2tGiFrRD6EWwLmxLjOpKDTuFRDRsb3sGOLXnTZxmIzuC
VwXn4aQThPl5S17yk9YH8UYAUdMA8eX/qSrse4OcHky3H2YolmCekWOSSxyNidEH
C9tGF29Va4YUFZACDCcsVi/9Til9Vc0LdCtwL5Ri0qrk2KQLb6dmzmdQFblro4h9
7yu/gN4STnkf5yC1WKtjsqmkhITR/Wv33E/uRqmMt9qgfB7Tg/tvuEMWUpOr+0Kd
yZVqU+fbPP6CY0CK+PlEDppjtmPOJQ==
=ByE/
-----END PGP SIGNATURE-----

--Sig_/vreASslLHYHFxDSelzvTor+--
