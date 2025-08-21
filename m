Return-Path: <linux-next+bounces-8061-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E0B2F2EC
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 10:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F889726AB3
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 08:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C4D2EB873;
	Thu, 21 Aug 2025 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="oPNeIzKu"
X-Original-To: linux-next@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4452EAB7A;
	Thu, 21 Aug 2025 08:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766164; cv=none; b=P2yY5+TwpMl2GjSQ0qWyFMnRFt+CgTKV5oMjRW20qvq30Qs5StZ6yngnge+FekYRJP4mg8qXS40qfqVcondlftn4baV+l0/UnD6hdTO3nqXHDuVv4B3Ob06IBKxFMqAItiV1dt+L5h7dIrTD6ywiiN254UCzGiuFv1ZzzbcfTAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766164; c=relaxed/simple;
	bh=PgAzkwhdnf5CXsYN4WOMAvJOARizvXMImVGwLF+8kIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rtf47BY4AmvD6w/Qh10ZLq/AfWpGtK843jZVPVWXavRh+YSVzoMrw2EMwKYihnC6FbHmXkUNP5vxXdaolWkTjRSINRjax9kEyE2DXAnM9+pHC34hY1rSTflMtJcHoWLDPa9rQVwBbDdtbOHHH+8pKtKY+oCfcP7SAiQhkzcTrWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=oPNeIzKu; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=seLj70oLEyzWgAeQ8viK3iSOdqrFuGn8qOUPkhlx74M=; t=1755766161;
	x=1756198161; b=oPNeIzKuokVrtEbrLWe3hc3METXF4wGKf4VYMwAgqVsXlexeu1SgvKAauWZrk
	rK8mGhruiLVSATGohQh6EyKWxZw/l8DlAx2l7pBDwzFzQEzgpqGVic1pe9TSkQi1Lv/FdkS48/sPS
	2Pqkp1KZm+wsA6N673Bb5yW0DFqHk2w3thXINNmzjGdiSMLOhUCIVxCiSrINE3VEwAHq+4pWd+bC6
	WvA+sa9Jw96o3z9I6OdQJkvWKA60p/GzpuLHpEkKuTZEMUkbPLSg00DD4cOtNyKQs7lf/xr/hpZoP
	fQlCue3aZonkZKmROuqlzE3K5zqUeeyUOc2VY9hg/o4gtk1GdA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1up0ys-008cB8-1K;
	Thu, 21 Aug 2025 10:49:10 +0200
Message-ID: <e21744a4-0155-40ec-b8c1-d81b14107c9f@leemhuis.info>
Date: Thu, 21 Aug 2025 10:49:09 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 3/5] binder: introduce transaction reports via netlink
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Li <dualli@google.com>
Cc: Tiffany Yang <ynaffit@google.com>, John Stultz <jstultz@google.com>,
 Shai Barack <shayba@google.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?=
 <tweek@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Joel Fernandes <joelagnelf@nvidia.com>, Todd Kjos <tkjos@android.com>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Donald Hunter <donald.hunter@gmail.com>,
 Christian Brauner <brauner@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
 Martijn Coenen <maco@android.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
References: <20250727182932.2499194-1-cmllamas@google.com>
 <20250727182932.2499194-4-cmllamas@google.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <20250727182932.2499194-4-cmllamas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1755766161;9f342946;
X-HE-SMSGID: 1up0ys-008cB8-1K

On 27.07.25 20:29, Carlos Llamas wrote:
> From: Li Li <dualli@google.com>
> 
> Introduce a generic netlink multicast event to report binder transaction
> failures to userspace. This allows subscribers to monitor these events
> and take appropriate actions, such as stopping a misbehaving application
> that is spamming a service with huge amount of transactions.
> 
> The multicast event contains full details of the failed transactions,
> including the sender/target PIDs, payload size and specific error code.
> This interface is defined using a YAML spec, from which the UAPI and
> kernel headers and source are auto-generated.

It seems to me like this patch (which showed up in -next today after
Greg merged it) caused a build error for me in my daily -next builds
for Fedora when building tools/net/ynl:

"""
make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
gcc -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow   -c -MMD -c -o ynl.o ynl.c
        AR ynl.a
make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
        GEN binder-user.c
Traceback (most recent call last):
  File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3673, in <module>
    main()
    ~~~~^^
  File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3382, in main
    parsed = Family(args.spec, exclude_ops)
  File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 1205, in __init__
    super().__init__(file_name, exclude_ops=exclude_ops)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/pyynl/lib/nlspec.py", line 462, in __init__
    jsonschema.validate(self.yaml, schema)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/site-packages/jsonschema/validators.py", line 1307, in validate
    raise error
jsonschema.exceptions.ValidationError: 'from_pid' does not match '^[0-9a-z-]+$'

Failed validating 'pattern' in schema['properties']['attribute-sets']['items']['properties']['attributes']['items']['properties']['name']:
    {'pattern': '^[0-9a-z-]+$', 'type': 'string'}

On instance['attribute-sets'][0]['attributes'][2]['name']:
    'from_pid'
make[1]: *** [Makefile:48: binder-user.c] Error 1
make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
make: *** [Makefile:25: generated] Error 2
"""

This is from a local build while investigating the problem. For
the error logs from my rpm builds, see:
https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-rawhide-x86_64/09453564-next-next-all/builder-live.log.gz

I could avoid the problem by reverting 5/5, 4/5, and this patch (3/5) 
from this series (I removed the former two to avoid conflicts).

Ciao, Thorsten

 
> Signed-off-by: Li Li <dualli@google.com>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
> ---
>  Documentation/netlink/specs/binder.yaml     | 93 +++++++++++++++++++++
>  MAINTAINERS                                 |  1 +
>  drivers/android/Kconfig                     |  1 +
>  drivers/android/Makefile                    |  2 +-
>  drivers/android/binder.c                    | 85 ++++++++++++++++++-
>  drivers/android/binder_netlink.c            | 31 +++++++
>  drivers/android/binder_netlink.h            | 20 +++++
>  include/uapi/linux/android/binder_netlink.h | 37 ++++++++
>  8 files changed, 265 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/netlink/specs/binder.yaml
>  create mode 100644 drivers/android/binder_netlink.c
>  create mode 100644 drivers/android/binder_netlink.h
>  create mode 100644 include/uapi/linux/android/binder_netlink.h
> 
> diff --git a/Documentation/netlink/specs/binder.yaml b/Documentation/netlink/specs/binder.yaml
> new file mode 100644
> index 000000000000..140b77a6afee
> --- /dev/null
> +++ b/Documentation/netlink/specs/binder.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +#
> +# Copyright 2025 Google LLC
> +#
> +---
> +name: binder
> +protocol: genetlink
> +uapi-header: linux/android/binder_netlink.h
> +doc: Binder interface over generic netlink
> +
> +attribute-sets:
> +  -
> +    name: report
> +    doc: |
> +      Attributes included within a transaction failure report. The elements
> +      correspond directly with the specific transaction that failed, along
> +      with the error returned to the sender e.g. BR_DEAD_REPLY.
> +
> +    attributes:
> +      -
> +        name: error
> +        type: u32
> +        doc: The enum binder_driver_return_protocol returned to the sender.
> +      -
> +        name: context
> +        type: string
> +        doc: The binder context where the transaction occurred.
> +      -
> +        name: from_pid
> +        type: u32
> +        doc: The PID of the sender process.
> +      -
> +        name: from_tid
> +        type: u32
> +        doc: The TID of the sender thread.
> +      -
> +        name: to_pid
> +        type: u32
> +        doc: |
> +          The PID of the recipient process. This attribute may not be present
> +          if the target could not be determined.
> +      -
> +        name: to_tid
> +        type: u32
> +        doc: |
> +          The TID of the recipient thread. This attribute may not be present
> +          if the target could not be determined.
> +      -
> +        name: is_reply
> +        type: flag
> +        doc: When present, indicates the failed transaction is a reply.
> +      -
> +        name: flags
> +        type: u32
> +        doc: The bitmask of enum transaction_flags from the transaction.
> +      -
> +        name: code
> +        type: u32
> +        doc: The application-defined code from the transaction.
> +      -
> +        name: data_size
> +        type: u32
> +        doc: The transaction payload size in bytes.
> +
> +operations:
> +  list:
> +    -
> +      name: report
> +      doc: |
> +        A multicast event sent to userspace subscribers to notify them about
> +        binder transaction failures. The generated report provides the full
> +        details of the specific transaction that failed. The intention is for
> +        programs to monitor these events and react to the failures as needed.
> +
> +      attribute-set: report
> +      mcgrp: report
> +      event:
> +        attributes:
> +          - error
> +          - context
> +          - from_pid
> +          - from_tid
> +          - to_pid
> +          - to_tid
> +          - is_reply
> +          - flags
> +          - code
> +          - data_size
> +
> +mcast-groups:
> +  list:
> +    -
> +      name: report
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f8c8f682edf6..df8f6b31f2f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1769,6 +1769,7 @@ M:	Suren Baghdasaryan <surenb@google.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> +F:	Documentation/netlink/specs/binder.yaml
>  F:	drivers/android/
>  
>  ANDROID GOLDFISH PIC DRIVER
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index 5b3b8041f827..75af3cf472c8 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -4,6 +4,7 @@ menu "Android"
>  config ANDROID_BINDER_IPC
>  	bool "Android Binder IPC Driver"
>  	depends on MMU
> +	depends on NET
>  	default n
>  	help
>  	  Binder is used in Android for both communication between processes,
> diff --git a/drivers/android/Makefile b/drivers/android/Makefile
> index c5d47be0276c..f422f91e026b 100644
> --- a/drivers/android/Makefile
> +++ b/drivers/android/Makefile
> @@ -2,5 +2,5 @@
>  ccflags-y += -I$(src)			# needed for trace events
>  
>  obj-$(CONFIG_ANDROID_BINDERFS)		+= binderfs.o
> -obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder.o binder_alloc.o
> +obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder.o binder_alloc.o binder_netlink.o
>  obj-$(CONFIG_ANDROID_BINDER_ALLOC_KUNIT_TEST)	+= tests/
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 95aa1fae53e2..0d37eca514f9 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -74,6 +74,7 @@
>  
>  #include <linux/cacheflush.h>
>  
> +#include "binder_netlink.h"
>  #include "binder_internal.h"
>  #include "binder_trace.h"
>  
> @@ -2993,6 +2994,67 @@ static void binder_set_txn_from_error(struct binder_transaction *t, int id,
>  	binder_thread_dec_tmpref(from);
>  }
>  
> +/**
> + * binder_netlink_report() - report a transaction failure via netlink
> + * @proc:	the binder proc sending the transaction
> + * @t:		the binder transaction that failed
> + * @data_size:	the user provided data size for the transaction
> + * @error:	enum binder_driver_return_protocol returned to sender
> + */
> +static void binder_netlink_report(struct binder_proc *proc,
> +				  struct binder_transaction *t,
> +				  u32 data_size,
> +				  u32 error)
> +{
> +	const char *context = proc->context->name;
> +	struct sk_buff *skb;
> +	void *hdr;
> +
> +	if (!genl_has_listeners(&binder_nl_family, &init_net,
> +				BINDER_NLGRP_REPORT))
> +		return;
> +
> +	skb = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
> +	if (!skb)
> +		return;
> +
> +	hdr = genlmsg_put(skb, 0, 0, &binder_nl_family, 0, BINDER_CMD_REPORT);
> +	if (!hdr)
> +		goto free_skb;
> +
> +	if (nla_put_u32(skb, BINDER_A_REPORT_ERROR, error) ||
> +	    nla_put_string(skb, BINDER_A_REPORT_CONTEXT, context) ||
> +	    nla_put_u32(skb, BINDER_A_REPORT_FROM_PID, t->from_pid) ||
> +	    nla_put_u32(skb, BINDER_A_REPORT_FROM_TID, t->from_tid))
> +		goto cancel_skb;
> +
> +	if (t->to_proc &&
> +	    nla_put_u32(skb, BINDER_A_REPORT_TO_PID, t->to_proc->pid))
> +		goto cancel_skb;
> +
> +	if (t->to_thread &&
> +	    nla_put_u32(skb, BINDER_A_REPORT_TO_TID, t->to_thread->pid))
> +		goto cancel_skb;
> +
> +	if (t->is_reply && nla_put_flag(skb, BINDER_A_REPORT_IS_REPLY))
> +		goto cancel_skb;
> +
> +	if (nla_put_u32(skb, BINDER_A_REPORT_FLAGS, t->flags) ||
> +	    nla_put_u32(skb, BINDER_A_REPORT_CODE, t->code) ||
> +	    nla_put_u32(skb, BINDER_A_REPORT_DATA_SIZE, data_size))
> +		goto cancel_skb;
> +
> +	genlmsg_end(skb, hdr);
> +	genlmsg_multicast(&binder_nl_family, skb, 0, BINDER_NLGRP_REPORT,
> +			  GFP_KERNEL);
> +	return;
> +
> +cancel_skb:
> +	genlmsg_cancel(skb, hdr);
> +free_skb:
> +	nlmsg_free(skb);
> +}
> +
>  static void binder_transaction(struct binder_proc *proc,
>  			       struct binder_thread *thread,
>  			       struct binder_transaction_data *tr, int reply,
> @@ -3679,10 +3741,13 @@ static void binder_transaction(struct binder_proc *proc,
>  		return_error_line = __LINE__;
>  		goto err_copy_data_failed;
>  	}
> -	if (t->buffer->oneway_spam_suspect)
> +	if (t->buffer->oneway_spam_suspect) {
>  		tcomplete->type = BINDER_WORK_TRANSACTION_ONEWAY_SPAM_SUSPECT;
> -	else
> +		binder_netlink_report(proc, t, tr->data_size,
> +				      BR_ONEWAY_SPAM_SUSPECT);
> +	} else {
>  		tcomplete->type = BINDER_WORK_TRANSACTION_COMPLETE;
> +	}
>  
>  	if (reply) {
>  		binder_enqueue_thread_work(thread, tcomplete);
> @@ -3730,8 +3795,11 @@ static void binder_transaction(struct binder_proc *proc,
>  		 * process and is put in a pending queue, waiting for the target
>  		 * process to be unfrozen.
>  		 */
> -		if (return_error == BR_TRANSACTION_PENDING_FROZEN)
> +		if (return_error == BR_TRANSACTION_PENDING_FROZEN) {
>  			tcomplete->type = BINDER_WORK_TRANSACTION_PENDING;
> +			binder_netlink_report(proc, t, tr->data_size,
> +					      return_error);
> +		}
>  		binder_enqueue_thread_work(thread, tcomplete);
>  		if (return_error &&
>  		    return_error != BR_TRANSACTION_PENDING_FROZEN)
> @@ -3789,6 +3857,8 @@ static void binder_transaction(struct binder_proc *proc,
>  		binder_dec_node(target_node, 1, 0);
>  		binder_dec_node_tmpref(target_node);
>  	}
> +
> +	binder_netlink_report(proc, t, tr->data_size, return_error);
>  	kfree(t);
>  	binder_stats_deleted(BINDER_STAT_TRANSACTION);
>  err_alloc_t_failed:
> @@ -7067,12 +7137,19 @@ static int __init binder_init(void)
>  		}
>  	}
>  
> -	ret = init_binderfs();
> +	ret = genl_register_family(&binder_nl_family);
>  	if (ret)
>  		goto err_init_binder_device_failed;
>  
> +	ret = init_binderfs();
> +	if (ret)
> +		goto err_init_binderfs_failed;
> +
>  	return ret;
>  
> +err_init_binderfs_failed:
> +	genl_unregister_family(&binder_nl_family);
> +
>  err_init_binder_device_failed:
>  	hlist_for_each_entry_safe(device, tmp, &binder_devices, hlist) {
>  		misc_deregister(&device->miscdev);
> diff --git a/drivers/android/binder_netlink.c b/drivers/android/binder_netlink.c
> new file mode 100644
> index 000000000000..d05397a50ca6
> --- /dev/null
> +++ b/drivers/android/binder_netlink.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/binder.yaml */
> +/* YNL-GEN kernel source */
> +
> +#include <net/netlink.h>
> +#include <net/genetlink.h>
> +
> +#include "binder_netlink.h"
> +
> +#include <uapi/linux/android/binder_netlink.h>
> +
> +/* Ops table for binder */
> +static const struct genl_split_ops binder_nl_ops[] = {
> +};
> +
> +static const struct genl_multicast_group binder_nl_mcgrps[] = {
> +	[BINDER_NLGRP_REPORT] = { "report", },
> +};
> +
> +struct genl_family binder_nl_family __ro_after_init = {
> +	.name		= BINDER_FAMILY_NAME,
> +	.version	= BINDER_FAMILY_VERSION,
> +	.netnsok	= true,
> +	.parallel_ops	= true,
> +	.module		= THIS_MODULE,
> +	.split_ops	= binder_nl_ops,
> +	.n_split_ops	= ARRAY_SIZE(binder_nl_ops),
> +	.mcgrps		= binder_nl_mcgrps,
> +	.n_mcgrps	= ARRAY_SIZE(binder_nl_mcgrps),
> +};
> diff --git a/drivers/android/binder_netlink.h b/drivers/android/binder_netlink.h
> new file mode 100644
> index 000000000000..882c7a6b537e
> --- /dev/null
> +++ b/drivers/android/binder_netlink.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/binder.yaml */
> +/* YNL-GEN kernel header */
> +
> +#ifndef _LINUX_BINDER_GEN_H
> +#define _LINUX_BINDER_GEN_H
> +
> +#include <net/netlink.h>
> +#include <net/genetlink.h>
> +
> +#include <uapi/linux/android/binder_netlink.h>
> +
> +enum {
> +	BINDER_NLGRP_REPORT,
> +};
> +
> +extern struct genl_family binder_nl_family;
> +
> +#endif /* _LINUX_BINDER_GEN_H */
> diff --git a/include/uapi/linux/android/binder_netlink.h b/include/uapi/linux/android/binder_netlink.h
> new file mode 100644
> index 000000000000..b218f96d6668
> --- /dev/null
> +++ b/include/uapi/linux/android/binder_netlink.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/binder.yaml */
> +/* YNL-GEN uapi header */
> +
> +#ifndef _UAPI_LINUX_ANDROID_BINDER_NETLINK_H
> +#define _UAPI_LINUX_ANDROID_BINDER_NETLINK_H
> +
> +#define BINDER_FAMILY_NAME	"binder"
> +#define BINDER_FAMILY_VERSION	1
> +
> +enum {
> +	BINDER_A_REPORT_ERROR = 1,
> +	BINDER_A_REPORT_CONTEXT,
> +	BINDER_A_REPORT_FROM_PID,
> +	BINDER_A_REPORT_FROM_TID,
> +	BINDER_A_REPORT_TO_PID,
> +	BINDER_A_REPORT_TO_TID,
> +	BINDER_A_REPORT_IS_REPLY,
> +	BINDER_A_REPORT_FLAGS,
> +	BINDER_A_REPORT_CODE,
> +	BINDER_A_REPORT_DATA_SIZE,
> +
> +	__BINDER_A_REPORT_MAX,
> +	BINDER_A_REPORT_MAX = (__BINDER_A_REPORT_MAX - 1)
> +};
> +
> +enum {
> +	BINDER_CMD_REPORT = 1,
> +
> +	__BINDER_CMD_MAX,
> +	BINDER_CMD_MAX = (__BINDER_CMD_MAX - 1)
> +};
> +
> +#define BINDER_MCGRP_REPORT	"report"
> +
> +#endif /* _UAPI_LINUX_ANDROID_BINDER_NETLINK_H */


