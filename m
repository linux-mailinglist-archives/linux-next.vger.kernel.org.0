Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D6F253A51
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 00:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgHZWip (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Aug 2020 18:38:45 -0400
Received: from ozlabs.org ([203.11.71.1]:40287 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbgHZWip (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Aug 2020 18:38:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BcLPD5XXxz9sSP;
        Thu, 27 Aug 2020 08:38:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598481521;
        bh=1x4FCQ0LAj50zy7UhVV7cFjx5dWto9itEBWu0qpUJDY=;
        h=Date:From:To:Cc:Subject:From;
        b=YYjx3AVhgGoKq7Z8CU9EPZWL8rEppaeG9St+rZ9eO2c+aWZ9YzNR2COeFQ04J+Kbr
         5iq34v9FsyMZu2YL6z9+RXUn4JkRqHvTfig2+0IiJLmIhkB8kDjHEvReN1guqc8baW
         YHZLmziW+SQ+lY3EphxujJsMVK7IrFlFmqKx7jZ66sFyHErGxrXYkBvSVhnlquOtmS
         4fc2XzfwTazwFe61nTpAsKH2aEH/NbkzWBBosr/nn5bgZ9OWlOfe9d4bgmCP/XTFc8
         6PQ8flZyfR8uzdxWZsBjYek0jQg5Bq+Bc3E4DzIPxJ9TFsEQB1CEcs5+84yKWXvlJj
         /bQm3nw8ePpEw==
Date:   Thu, 27 Aug 2020 08:38:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warnings from perf build in Linus' tree
Message-ID: <20200827083839.276cc0d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J2kbYrSdFrhfNIp2WYrruP.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J2kbYrSdFrhfNIp2WYrruP.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Doing the perf native (PowerPC le) build today produces these warnings:

util/dsos.c: In function 'dsos__findnew_id':
util/dsos.c:39:14: note: the layout of aggregates containing vectors with 8=
-byte alignment has changed in GCC 5
   39 |  dso->id.maj =3D id->maj;
      |  ~~~~~~~~~~~~^~~~~~~~~
util/namespaces.c: In function 'nsinfo__new':
util/namespaces.c:139:12: note: the layout of aggregates containing vectors=
 with 8-byte alignment has changed in GCC 5
  139 |   nsi->pid =3D pid;
      |   ~~~~~~~~~^~~~~
util/evlist.c: In function 'perf_evlist__set_id_pos':
util/evlist.c:116:17: note: the layout of aggregates containing vectors wit=
h 8-byte alignment has changed in GCC 5
  116 |  evlist->id_pos =3D first->id_pos;
      |  ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
util/annotate.c: In function 'annotation__init_column_widths':
util/annotate.c:2701:44: note: the layout of aggregates containing vectors =
with 2-byte alignment has changed in GCC 5
 2701 |  notes->widths.addr =3D notes->widths.target =3D
      |                       ~~~~~~~~~~~~~~~~~~~~~^
 2702 |   notes->widths.min_addr =3D hex_width(symbol__size(sym));
      |   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
util/session.c: In function 'perf_event__read_swap':
util/session.c:620:20: note: the layout of aggregates containing vectors wi=
th 8-byte alignment has changed in GCC 5
  620 |  event->read.pid   =3D bswap_32(event->read.pid);
      |                    ^
util/jitdump.c: In function 'jit_process':
util/jitdump.c:329:23: note: the layout of aggregates containing vectors wi=
th 8-byte alignment has changed in GCC 5
  329 |    jr->load.pid       =3D bswap_32(jr->load.pid);
      |                       ^
util/auxtrace.c: In function 'auxtrace_queues__add_buffer.part.0':
util/auxtrace.c:360:12: note: the layout of aggregates containing vectors w=
ith 8-byte alignment has changed in GCC 5
  360 | static int auxtrace_queues__add_buffer(struct auxtrace_queues *queu=
es,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
util/synthetic-events.c: In function 'perf_event__synthesize_sample':
util/synthetic-events.c:1441:22: note: the layout of aggregates containing =
vectors with 8-byte alignment has changed in GCC 5
 1441 |   u.val32[0] =3D sample->pid;
      |                ~~~~~~^~~~~
util/probe-finder.c: In function 'line_range_search_cb':
util/probe-finder.c:1887:17: note: the layout of aggregates containing vect=
ors with 8-byte alignment has changed in GCC 5
 1887 |   lr->start =3D lf->lno_s;
      |               ~~^~~~~~~
util/machine.c: In function 'machine__process_mmap2_event':
util/machine.c:1716:5: note: the layout of aggregates containing vectors wi=
th 8-byte alignment has changed in GCC 5
 1716 | int machine__process_mmap2_event(struct machine *machine,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
util/intel-pt-decoder/intel-pt-decoder.c: In function 'intel_pt_get_next_pa=
cket':
util/intel-pt-decoder/intel-pt-decoder.c:916:21: note: the layout of aggreg=
ates containing vectors with 8-byte alignment has changed in GCC 5
  916 |   decoder->pkt_step =3D ret;
      |   ~~~~~~~~~~~~~~~~~~^~~~~
util/pmu.c: In function '__perf_pmu__new_alias':
util/pmu.c:308:12: note: the layout of aggregates containing vectors with 2=
-byte alignment has changed in GCC 5
  308 | static int __perf_pmu__new_alias(struct list_head *list, char *dir,=
 char *name,
      |            ^~~~~~~~~~~~~~~~~~~~~
util/intel-pt.c: In function 'intel_pt_synth_pebs_sample':
util/intel-pt.c:1284:14: note: the layout of aggregates containing vectors =
with 8-byte alignment has changed in GCC 5
 1284 |  sample->pid =3D ptq->pid;
      |  ~~~~~~~~~~~~^~~~~~~~~~
util/parse-events.c: In function 'parse_events__modifier_event':
util/parse-events.c:1885:5: note: the layout of aggregates containing vecto=
rs with 8-byte alignment has changed in GCC 5
 1885 | int parse_events__modifier_event(struct list_head *list, char *str,=
 bool add)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/sfr/next/next/tools/perf/util/namespaces.c: In function 'nsinfo__new':
/home/sfr/next/next/tools/perf/util/namespaces.c:139:12: note: the layout o=
f aggregates containing vectors with 8-byte alignment has changed in GCC 5
  139 |   nsi->pid =3D pid;
      |   ~~~~~~~~~^~~~~

I assume they are because I have changed all my toolcahins to gcc
v10 today.

--=20
Cheers,
Stephen Rothwell

--Sig_/J2kbYrSdFrhfNIp2WYrruP.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9G5G8ACgkQAVBC80lX
0GwNRwf9G1zbd8OE1SDujx2Bk7PC4VYak4TxBjUjluC7FluPSY32IPhYqPnU5aEx
cuaxNPg3QDctPa1DY/gtOjCAT/qzeGn+FeeLO04Ek9AIPr4jMnN2Fb/Vrq7W7/gv
zVrxbY4sVwNXgiOpGgJd9Nsd06FH8ZezUtUcZKhNkXyufCx22w6zrh2rOO4SApTe
mp75wJWzb2WsH+fIQ0t+sBuv86qbNMJ2CMCoiUN6vAh7h2vY4ZARu4hp93bvsPfr
gNV4/B0SdTZLKwOSxR8H4O37Tk8JTZqgyd0SexZ/JRigEEdBJ0XuxfYDgbhlJa/U
wXyy5ATb75bbjCD+4OM5Is1CrswXBQ==
=GQX2
-----END PGP SIGNATURE-----

--Sig_/J2kbYrSdFrhfNIp2WYrruP.--
