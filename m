Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AEE3F449E
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 07:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhHWFWV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 01:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbhHWFWV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 01:22:21 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D103EC061575;
        Sun, 22 Aug 2021 22:21:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtLFW1y7hz9sSs;
        Mon, 23 Aug 2021 15:21:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629696095;
        bh=ZoH2SanBe2x53hm2+4yhICui8LqzceUj7/q40Q5aveo=;
        h=Date:From:To:Cc:Subject:From;
        b=DzmRbS6n1RaQsI2Jputegq1Oe+cIERqNMgL+FmMKDVL+xvBaAmmzbn3st+rZgTU/y
         OyxT23cWoQqFzadGXRkxEqba0vUkMiXc7jY00i44Ofuhni6ghGt3bci5zztSvBC3uc
         W+fiq2rRpigYlSWdWl3FK9qa1lwzkoxkloacMguPm+owcOBuel7BsYGZCCNSclvtmW
         XuwNMcW5mqPN3tJcnPN2Fg/poOdZMbdoZHS6GsGpIH3DJSteaGGUX9hf8mk75o5yQq
         GATpW0vmqnsoRFOqMmuDpFPTn3A0uj9XdUqXlRRxPfKDjSFBpD8QX/bcCg6khL267K
         aea/8DzFBN1sg==
Date:   Mon, 23 Aug 2021 15:21:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Gwendal Grignou <gwendal@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the chrome-platform tree
Message-ID: <20210823152134.00d95cb4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a5u1jN6JldO845TR5XQ+Vef";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a5u1jN6JldO845TR5XQ+Vef
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the chrome-platform tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/trace/define_trace.h:102,
                 from drivers/platform/chrome/cros_ec_trace.h:178,
                 from drivers/platform/chrome/cros_ec_trace.c:215:
drivers/platform/chrome/./cros_ec_trace.h: In function 'trace_raw_output_cr=
os_ec_sensorhub_timestamp':
drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format '%lld' exp=
ects argument of type 'long long int', but argument 3 has type 'u32' {aka '=
unsigned int'} [-Wformat=3D]
   95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, cur=
r_ts: %12lld, curr_time: %12lld, delta %12lld",
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/trace/trace_events.h:399:27: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  399 |  trace_event_printf(iter, print);    \
      |                           ^~~~~
include/trace/trace_events.h:80:9: note: in expansion of macro 'PARAMS'
   80 |         PARAMS(print));         \
      |         ^~~~~~
drivers/platform/chrome/./cros_ec_trace.h:74:1: note: in expansion of macro=
 'TRACE_EVENT'
   74 | TRACE_EVENT(cros_ec_sensorhub_timestamp,
      | ^~~~~~~~~~~
drivers/platform/chrome/./cros_ec_trace.h:95:2: note: in expansion of macro=
 'TP_printk'
   95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, cur=
r_ts: %12lld, curr_time: %12lld, delta %12lld",
      |  ^~~~~~~~~
In file included from include/trace/trace_events.h:433,
                 from include/trace/define_trace.h:102,
                 from drivers/platform/chrome/cros_ec_trace.h:178,
                 from drivers/platform/chrome/cros_ec_trace.c:215:
drivers/platform/chrome/./cros_ec_trace.h:95:25: note: format string is def=
ined here
   95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, cur=
r_ts: %12lld, curr_time: %12lld, delta %12lld",
      |                    ~~~~~^
      |                         |
      |                         long long int
      |                    %12d
In file included from include/trace/define_trace.h:102,
                 from drivers/platform/chrome/cros_ec_trace.h:178,
                 from drivers/platform/chrome/cros_ec_trace.c:215:
drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format '%lld' exp=
ects argument of type 'long long int', but argument 4 has type 'u32' {aka '=
unsigned int'} [-Wformat=3D]
   95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, cur=
r_ts: %12lld, curr_time: %12lld, delta %12lld",
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/trace/trace_events.h:399:27: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  399 |  trace_event_printf(iter, print);    \
      |                           ^~~~~
include/trace/trace_events.h:80:9: note: in expansion of macro 'PARAMS'
   80 |         PARAMS(print));         \
      |         ^~~~~~
drivers/platform/chrome/./cros_ec_trace.h:74:1: note: in expansion of macro=
 'TRACE_EVENT'
   74 | TRACE_EVENT(cros_ec_sensorhub_timestamp,
      | ^~~~~~~~~~~
drivers/platform/chrome/./cros_ec_trace.h:95:2: note: in expansion of macro=
 'TP_printk'
   95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, cur=
r_ts: %12lld, curr_time: %12lld, delta %12lld",
      |  ^~~~~~~~~
In file included from include/trace/trace_events.h:433,
                 from include/trace/define_trace.h:102,
                 from drivers/platform/chrome/cros_ec_trace.h:178,
                 from drivers/platform/chrome/cros_ec_trace.c:215:
drivers/platform/chrome/./cros_ec_trace.h:95:45: note: format string is def=
ined here
   95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, cur=
r_ts: %12lld, curr_time: %12lld, delta %12lld",
      |                                        ~~~~~^
      |                                             |
      |                                             long long int
      |                                        %12d
In file included from include/trace/define_trace.h:102,
                 from drivers/platform/chrome/cros_ec_trace.h:178,
                 from drivers/platform/chrome/cros_ec_trace.c:215:
drivers/platform/chrome/./cros_ec_trace.h: In function 'trace_raw_output_cr=
os_ec_sensorhub_data':
drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format '%lld' ex=
pects argument of type 'long long int', but argument 4 has type 'u32' {aka =
'unsigned int'} [-Wformat=3D]
  125 |  TP_printk("ec_num: %4d, ec_fifo_ts: %12lld, fifo_ts: %12lld, curr_=
ts: %12lld, curr_time: %12lld, delta %12lld",
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/trace/trace_events.h:399:27: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  399 |  trace_event_printf(iter, print);    \
      |                           ^~~~~
include/trace/trace_events.h:80:9: note: in expansion of macro 'PARAMS'
   80 |         PARAMS(print));         \
      |         ^~~~~~
drivers/platform/chrome/./cros_ec_trace.h:105:1: note: in expansion of macr=
o 'TRACE_EVENT'
  105 | TRACE_EVENT(cros_ec_sensorhub_data,
      | ^~~~~~~~~~~
drivers/platform/chrome/./cros_ec_trace.h:125:2: note: in expansion of macr=
o 'TP_printk'
  125 |  TP_printk("ec_num: %4d, ec_fifo_ts: %12lld, fifo_ts: %12lld, curr_=
ts: %12lld, curr_time: %12lld, delta %12lld",
      |  ^~~~~~~~~
In file included from include/trace/trace_events.h:433,
                 from include/trace/define_trace.h:102,
                 from drivers/platform/chrome/cros_ec_trace.h:178,
                 from drivers/platform/chrome/cros_ec_trace.c:215:
drivers/platform/chrome/./cros_ec_trace.h:125:43: note: format string is de=
fined here
  125 |  TP_printk("ec_num: %4d, ec_fifo_ts: %12lld, fifo_ts: %12lld, curr_=
ts: %12lld, curr_time: %12lld, delta %12lld",
      |                                      ~~~~~^
      |                                           |
      |                                           long long int
      |                                      %12d
In file included from include/trace/define_trace.h:102,
                 from drivers/platform/chrome/cros_ec_trace.h:178,
                 from drivers/platform/chrome/cros_ec_trace.c:215:
drivers/platform/chrome/./cros_ec_trace.h: In function 'trace_raw_output_cr=
os_ec_sensorhub_filter':
drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format '%d' expe=
cts argument of type 'int', but argument 7 has type 's64' {aka 'long long i=
nt'} [-Wformat=3D]
  156 |  TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %=
12lld len: %d x: %12lld y: %12lld",
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/trace/trace_events.h:399:27: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  399 |  trace_event_printf(iter, print);    \
      |                           ^~~~~
include/trace/trace_events.h:80:9: note: in expansion of macro 'PARAMS'
   80 |         PARAMS(print));         \
      |         ^~~~~~
drivers/platform/chrome/./cros_ec_trace.h:135:1: note: in expansion of macr=
o 'TRACE_EVENT'
  135 | TRACE_EVENT(cros_ec_sensorhub_filter,
      | ^~~~~~~~~~~
drivers/platform/chrome/./cros_ec_trace.h:156:2: note: in expansion of macr=
o 'TP_printk'
  156 |  TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %=
12lld len: %d x: %12lld y: %12lld",
      |  ^~~~~~~~~
In file included from include/trace/trace_events.h:433,
                 from include/trace/define_trace.h:102,
                 from drivers/platform/chrome/cros_ec_trace.h:178,
                 from drivers/platform/chrome/cros_ec_trace.c:215:
drivers/platform/chrome/./cros_ec_trace.h:156:80: note: format string is de=
fined here
  156 |  TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %=
12lld len: %d x: %12lld y: %12lld",
      |                                                                    =
           ~^
      |                                                                    =
            |
      |                                                                    =
            int
      |                                                                    =
           %lld

Introduced by commit

  d453ceb6549a ("platform/chrome: sensorhub: Add trace events for sample")

--=20
Cheers,
Stephen Rothwell

--Sig_/a5u1jN6JldO845TR5XQ+Vef
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEjMF4ACgkQAVBC80lX
0GztVgf/Z9SqFDTj+rMXtiKvihK/cy7dFkooXHAfux/+F02qh9Eg6bX/KqpCethv
03EcFTn9qj25wPHmy4VB3oUo2xrLqjNHTA0/lCwuFzN+fvTxdkLb7a4ju18Kzh4h
M0JVsDWAbq8hNir8XZ0CbeJfTdeyCDMSLkbbmu5Cu29o5aXlDs3BwPDiyEBQ44pq
ovFjGBndZ4PMJ42gEWTodctVsm3Bp0qbA7DEto8IK/D+219MOQIIkWF62eIcQxV2
Wt22thXsRQFFGDSe3X64qST9Z+nRl0jbsD2HID/LM0ySmDfOXD5/X3L9f/aO84og
5HV8b3TLAh8Kg+cBMkJvdgcqagxYiQ==
=Ak0B
-----END PGP SIGNATURE-----

--Sig_/a5u1jN6JldO845TR5XQ+Vef--
