Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9A9268316
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 05:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgINDXI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Sep 2020 23:23:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46637 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgINDXG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 13 Sep 2020 23:23:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BqWs20pq6z9sTR;
        Mon, 14 Sep 2020 13:23:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600053783;
        bh=Sv0YKuYUl7NDKVLQVoIcSLvO6+V38WnqXhWkfR3XTls=;
        h=Date:From:To:Cc:Subject:From;
        b=G+yVmA4seQPm1hm6ZH9Dz0ikVRUSH/FrUoxkz51WNk0unO7UXbuqwkTWsPpiqdtq2
         UsnNgAbDjiDjo3H3p9I7u8yFjA3FwhzHifsiVUAt/b0GNkgGcYzYXWHrSBjG7DCVv5
         ZnzavFuOvtkzsd6KBgvVVEk77Yuxnh6aqQlHYJBASTly0YaU1oGoaOg86x81wDZRiH
         WB7NhGA8k3WklD09IDolhXoPoRJJxU67MoWR5/TUBe0rxXM4v5ZUF48xB1zfWyNWBP
         GTMu970DRCGYZgEfxoib1u9vlS7vKRERP2pzHbu/GV1dKlS1zlLur5DK7QcIlk/D3A
         3Ym9KG4LtmRfg==
Date:   Mon, 14 Sep 2020 13:22:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20200914132249.40c88461@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4sJkOs7QUaj=qx3tE_D6AhX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4sJkOs7QUaj=qx3tE_D6AhX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_kprobe_selftest.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_clock.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/ftrace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/ring_buffer.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_output.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_seq.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_stat.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_printk.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/tracing_map.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_sched_switch.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_functions.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_preemptirq.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_irqsoff.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_sched_wakeup.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_hwlat.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_nop.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_stack.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_mmiotrace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_functions_graph.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/blktrace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/fgraph.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_export.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_syscalls.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_event_perf.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_filter.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_trigger.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_inject.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_synth.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_hist.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/bpf_trace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_kprobe.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/power-traces.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/rpm-traces.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_kdb.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_dynevent.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_probe.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_uprobe.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_boot.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_benchmark.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_kprobe_selftest.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_clock.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/ftrace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/ring_buffer.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_output.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_seq.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_stat.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_printk.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/tracing_map.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_sched_switch.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_functions.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_preemptirq.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_irqsoff.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_sched_wakeup.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_hwlat.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_nop.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_stack.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_mmiotrace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_functions_graph.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/blktrace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/fgraph.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_export.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_syscalls.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_event_perf.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_filter.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_trigger.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_inject.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_synth.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_hist.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/bpf_trace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_kprobe.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/power-traces.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/rpm-traces.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_kdb.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_dynevent.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_probe.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_uprobe.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_boot.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_benchmark.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_kprobe_selftest.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_clock.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/ftrace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/ring_buffer.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_output.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_seq.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_stat.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_printk.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/tracing_map.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_sched_switch.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_functions.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_preemptirq.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_irqsoff.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_sched_wakeup.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_hwlat.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_nop.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_stack.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_mmiotrace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_functions_graph.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/blktrace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/fgraph.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_export.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_syscalls.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_event_perf.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_filter.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_trigger.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_inject.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_synth.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_events_hist.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/bpf_trace.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_kprobe.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/power-traces.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/rpm-traces.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_kdb.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_dynevent.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_probe.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_uprobe.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_boot.o' being placed in section `.ctors.65435'
x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kernel/tr=
ace/trace_benchmark.o' being placed in section `.ctors.65435'

Probably exposed by commit

  83109d5d5fba ("x86/build: Warn on orphan section placement")

--=20
Cheers,
Stephen Rothwell

--Sig_/4sJkOs7QUaj=qx3tE_D6AhX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9e4gkACgkQAVBC80lX
0GzlPQf/SkTDzBnp994bf+duWs0MqhdnCqWOoWb8jiO03zrdbd28zWIAlsI2ZUWo
iweyodCi0WllXcM7mtbEO7GSqCOerd9XwwwTb6rd8BpVfeJkZmAQYep3bnq6v4Uv
xJJwIoxIPK6uvwmUXwpl8Hf139IHulQNDqlwSIskVAFiBp1OYa/mNtaSZ29GziPO
cywEjAHjyBzT78Tbi0m4zDn3E2ObIeAlWlrQDgdf1PoPWtDep4XIg53opuZBp8g8
E5bzL+PHhJC6bjiEAg+fSyxe8cZ4sXLHeLEjVrNFDUP9Kf/aTjxP8XA1E5GXEIQa
S5SvZC2Z2Jis+kIdkHFegEyenrRFyg==
=MME2
-----END PGP SIGNATURE-----

--Sig_/4sJkOs7QUaj=qx3tE_D6AhX--
