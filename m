Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084713FB1D9
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 09:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbhH3HWn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 03:22:43 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:47835 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233758AbhH3HWn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 03:22:43 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4GyhZj2qBvz101Y;
        Mon, 30 Aug 2021 17:21:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
        s=201702; t=1630308094;
        bh=lAQYWCejRyClzi0q0Fo1A3iK2APP2Ag8X0Ey4agQk0o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QBhSDFHkfbYorFlYfIjML+QQBtp5rL4VxJ04WYV6zwg+b58QMB8Zoma6LWTN7W8nx
         +iDZM0z+pFpiZqL2Na+Qz9CtGnY14KOFnUZBbF/cxJxsud0uVFD04vzM2AH6kxkol6
         MZRbqW5MeSbh9SYrKiTHW3rYrY5seHtDDlC1K7dx+ErsL7lbSxKgGHwA/0vlF9siUl
         TQsX1zTkXRe1HUUNfnZ3nyc19RMmP6KQvmDGtT6luQWNDLMMyYy9o+6DDh9QWO0Wqc
         80i3nAQL8HUHZu2Khy47GA55cfCepDELs2xeXC9UdGQUncyMRnmpkEP3BruVm0/9WD
         dbsBNGVuuVB8Q==
Date:   Mon, 30 Aug 2021 17:21:32 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Gwendal Grignou <gwendal@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the chrome-platform
 tree
Message-ID: <20210830172132.4fc0ae7f@elm.ozlabs.ibm.com>
In-Reply-To: <20210823152134.00d95cb4@canb.auug.org.au>
References: <20210823152134.00d95cb4@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XZx8fmw4i43Tzdtc9zbevib";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XZx8fmw4i43Tzdtc9zbevib
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 23 Aug 2021 15:21:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the chrome-platform tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> In file included from include/trace/define_trace.h:102,
>                  from drivers/platform/chrome/cros_ec_trace.h:178,
>                  from drivers/platform/chrome/cros_ec_trace.c:215:
> drivers/platform/chrome/./cros_ec_trace.h: In function 'trace_raw_output_=
cros_ec_sensorhub_timestamp':
> drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format '%lld' e=
xpects argument of type 'long long int', but argument 3 has type 'u32' {aka=
 'unsigned int'} [-Wformat=3D]
>    95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, c=
urr_ts: %12lld, curr_time: %12lld, delta %12lld",
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/trace/trace_events.h:399:27: note: in definition of macro 'DECLAR=
E_EVENT_CLASS'
>   399 |  trace_event_printf(iter, print);    \
>       |                           ^~~~~
> include/trace/trace_events.h:80:9: note: in expansion of macro 'PARAMS'
>    80 |         PARAMS(print));         \
>       |         ^~~~~~
> drivers/platform/chrome/./cros_ec_trace.h:74:1: note: in expansion of mac=
ro 'TRACE_EVENT'
>    74 | TRACE_EVENT(cros_ec_sensorhub_timestamp,
>       | ^~~~~~~~~~~
> drivers/platform/chrome/./cros_ec_trace.h:95:2: note: in expansion of mac=
ro 'TP_printk'
>    95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, c=
urr_ts: %12lld, curr_time: %12lld, delta %12lld",
>       |  ^~~~~~~~~
> In file included from include/trace/trace_events.h:433,
>                  from include/trace/define_trace.h:102,
>                  from drivers/platform/chrome/cros_ec_trace.h:178,
>                  from drivers/platform/chrome/cros_ec_trace.c:215:
> drivers/platform/chrome/./cros_ec_trace.h:95:25: note: format string is d=
efined here
>    95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, c=
urr_ts: %12lld, curr_time: %12lld, delta %12lld",
>       |                    ~~~~~^
>       |                         |
>       |                         long long int
>       |                    %12d
> In file included from include/trace/define_trace.h:102,
>                  from drivers/platform/chrome/cros_ec_trace.h:178,
>                  from drivers/platform/chrome/cros_ec_trace.c:215:
> drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format '%lld' e=
xpects argument of type 'long long int', but argument 4 has type 'u32' {aka=
 'unsigned int'} [-Wformat=3D]
>    95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, c=
urr_ts: %12lld, curr_time: %12lld, delta %12lld",
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/trace/trace_events.h:399:27: note: in definition of macro 'DECLAR=
E_EVENT_CLASS'
>   399 |  trace_event_printf(iter, print);    \
>       |                           ^~~~~
> include/trace/trace_events.h:80:9: note: in expansion of macro 'PARAMS'
>    80 |         PARAMS(print));         \
>       |         ^~~~~~
> drivers/platform/chrome/./cros_ec_trace.h:74:1: note: in expansion of mac=
ro 'TRACE_EVENT'
>    74 | TRACE_EVENT(cros_ec_sensorhub_timestamp,
>       | ^~~~~~~~~~~
> drivers/platform/chrome/./cros_ec_trace.h:95:2: note: in expansion of mac=
ro 'TP_printk'
>    95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, c=
urr_ts: %12lld, curr_time: %12lld, delta %12lld",
>       |  ^~~~~~~~~
> In file included from include/trace/trace_events.h:433,
>                  from include/trace/define_trace.h:102,
>                  from drivers/platform/chrome/cros_ec_trace.h:178,
>                  from drivers/platform/chrome/cros_ec_trace.c:215:
> drivers/platform/chrome/./cros_ec_trace.h:95:45: note: format string is d=
efined here
>    95 |  TP_printk("ec_ts: %12lld, ec_fifo_ts: %12lld, fifo_ts: %12lld, c=
urr_ts: %12lld, curr_time: %12lld, delta %12lld",
>       |                                        ~~~~~^
>       |                                             |
>       |                                             long long int
>       |                                        %12d
> In file included from include/trace/define_trace.h:102,
>                  from drivers/platform/chrome/cros_ec_trace.h:178,
>                  from drivers/platform/chrome/cros_ec_trace.c:215:
> drivers/platform/chrome/./cros_ec_trace.h: In function 'trace_raw_output_=
cros_ec_sensorhub_data':
> drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format '%lld' =
expects argument of type 'long long int', but argument 4 has type 'u32' {ak=
a 'unsigned int'} [-Wformat=3D]
>   125 |  TP_printk("ec_num: %4d, ec_fifo_ts: %12lld, fifo_ts: %12lld, cur=
r_ts: %12lld, curr_time: %12lld, delta %12lld",
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/trace/trace_events.h:399:27: note: in definition of macro 'DECLAR=
E_EVENT_CLASS'
>   399 |  trace_event_printf(iter, print);    \
>       |                           ^~~~~
> include/trace/trace_events.h:80:9: note: in expansion of macro 'PARAMS'
>    80 |         PARAMS(print));         \
>       |         ^~~~~~
> drivers/platform/chrome/./cros_ec_trace.h:105:1: note: in expansion of ma=
cro 'TRACE_EVENT'
>   105 | TRACE_EVENT(cros_ec_sensorhub_data,
>       | ^~~~~~~~~~~
> drivers/platform/chrome/./cros_ec_trace.h:125:2: note: in expansion of ma=
cro 'TP_printk'
>   125 |  TP_printk("ec_num: %4d, ec_fifo_ts: %12lld, fifo_ts: %12lld, cur=
r_ts: %12lld, curr_time: %12lld, delta %12lld",
>       |  ^~~~~~~~~
> In file included from include/trace/trace_events.h:433,
>                  from include/trace/define_trace.h:102,
>                  from drivers/platform/chrome/cros_ec_trace.h:178,
>                  from drivers/platform/chrome/cros_ec_trace.c:215:
> drivers/platform/chrome/./cros_ec_trace.h:125:43: note: format string is =
defined here
>   125 |  TP_printk("ec_num: %4d, ec_fifo_ts: %12lld, fifo_ts: %12lld, cur=
r_ts: %12lld, curr_time: %12lld, delta %12lld",
>       |                                      ~~~~~^
>       |                                           |
>       |                                           long long int
>       |                                      %12d
> In file included from include/trace/define_trace.h:102,
>                  from drivers/platform/chrome/cros_ec_trace.h:178,
>                  from drivers/platform/chrome/cros_ec_trace.c:215:
> drivers/platform/chrome/./cros_ec_trace.h: In function 'trace_raw_output_=
cros_ec_sensorhub_filter':
> drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format '%d' ex=
pects argument of type 'int', but argument 7 has type 's64' {aka 'long long=
 int'} [-Wformat=3D]
>   156 |  TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error:=
 %12lld len: %d x: %12lld y: %12lld",
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/trace/trace_events.h:399:27: note: in definition of macro 'DECLAR=
E_EVENT_CLASS'
>   399 |  trace_event_printf(iter, print);    \
>       |                           ^~~~~
> include/trace/trace_events.h:80:9: note: in expansion of macro 'PARAMS'
>    80 |         PARAMS(print));         \
>       |         ^~~~~~
> drivers/platform/chrome/./cros_ec_trace.h:135:1: note: in expansion of ma=
cro 'TRACE_EVENT'
>   135 | TRACE_EVENT(cros_ec_sensorhub_filter,
>       | ^~~~~~~~~~~
> drivers/platform/chrome/./cros_ec_trace.h:156:2: note: in expansion of ma=
cro 'TP_printk'
>   156 |  TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error:=
 %12lld len: %d x: %12lld y: %12lld",
>       |  ^~~~~~~~~
> In file included from include/trace/trace_events.h:433,
>                  from include/trace/define_trace.h:102,
>                  from drivers/platform/chrome/cros_ec_trace.h:178,
>                  from drivers/platform/chrome/cros_ec_trace.c:215:
> drivers/platform/chrome/./cros_ec_trace.h:156:80: note: format string is =
defined here
>   156 |  TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error:=
 %12lld len: %d x: %12lld y: %12lld",
>       |                                                                  =
             ~^
>       |                                                                  =
              |
>       |                                                                  =
              int
>       |                                                                  =
             %lld
>=20
> Introduced by commit
>=20
>   d453ceb6549a ("platform/chrome: sensorhub: Add trace events for sample")

I am still seeing these warnings.
--=20
Cheers,
Stephen Rothwell

--Sig_/XZx8fmw4i43Tzdtc9zbevib
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEshvwACgkQAVBC80lX
0GwnsAf/YURGA3ZQxEcd/CoH5s7svU1X0wOktub5v5EdxUOPEhFCL0x7X1sZqs57
Z0NC0uymud7Oj7d2yN+7N2uoBDV+Rr1n0E/z+jqtkfiIYb/a+Szs2B1GGrsMvczh
EUrUc8f7zTCgyeR+5M/SMAiwmm5rOOf/oYYSYigG+I5KHmBo3aWYXQbSoWdVrW3a
RuIvbJQQ4V8m7TiwLK0AOJJ/rbGl90woIqOJrfbwHCzCzA8YVPQKuceQ/U9fDEXI
TaB/EmFjZ76YaqkRx8W3eNPEWityM6cMDr6vgExqbvCzynkl+m3nU3ezfH/TBhg1
5AXX4OkZbA+YCqIFhbzJT0+SO9pIoA==
=Pne7
-----END PGP SIGNATURE-----

--Sig_/XZx8fmw4i43Tzdtc9zbevib--
