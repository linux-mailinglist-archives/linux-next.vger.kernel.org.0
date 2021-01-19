Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE0CC2FB762
	for <lists+linux-next@lfdr.de>; Tue, 19 Jan 2021 15:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731990AbhASKsD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jan 2021 05:48:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:56556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbhASJIP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Jan 2021 04:08:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40B1D23100;
        Tue, 19 Jan 2021 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611047254;
        bh=2JlmlcOU6/oPKSB6DAlPaJLth+2lszMUnJgcqSAY+MM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DDfvdujYmU21uLv+qV/JzeQE/ApJE3VuyVppp0CGB8iOtjDEAYALhtIkCJJqEHYXv
         Lwnd95ACF4pEgrBoxgnIIpPgYCLSgphiAVwfmVHFe9M2+q5FZ7/SXD0aMOFF4igdw3
         9cIr1LSLE5XMuG+mXYaJypQCI6zTHMGNdg9ZKI9ahJeArv/Ul/fEDY3WHsM1sucQgO
         IugZrWFNI4vg4W/MQs2SBO7amtsAKkLeP61vjLmJaJrJhamNJVaJceCRR4183Ehmz8
         a1W9daVUhNQJhfn7HOlZqhTP3zl76AznAWnO4W2INf5WzsleKI8K24iFGVPMZSdaKn
         mgKFUKc34YVGg==
Date:   Tue, 19 Jan 2021 10:07:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the jc_docs tree
Message-ID: <20210119100729.512dbb09@coco.lan>
In-Reply-To: <20210119171303.6be1bb1f@canb.auug.org.au>
References: <20210119171303.6be1bb1f@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Em Tue, 19 Jan 2021 17:13:03 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> After merging the jc_docs tree, today's linux-next build (KCONFIG_NAME)
> produced these warnings:
> 
> fs/pstore/zone.c:39: warning: expecting prototype for struct psz_head. Prototype was for struct psz_buffer instead
> include/linux/connector.h:122: warning: expecting prototype for cn_netlink_send_mult(). Prototype was for cn_netlink_send() instead
> include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting prototype for Service layer driver supports client names(). Prototype was for SVC_CLIENT_FPGA() instead
> include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
> include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RECONFIG_FLAG_PARTIAL() instead
> include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting prototype for Timeout settings for service clients(). Prototype was for SVC_RECONFIG_REQUEST_TIMEOUT_MS() instead
> include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting prototype for intel_svc_done(). Prototype was for stratix10_svc_done() instead
> include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting prototype for Service layer driver supports client names(). Prototype was for SVC_CLIENT_FPGA() instead
> include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
> include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RECONFIG_FLAG_PARTIAL() instead
> include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting prototype for Timeout settings for service clients(). Prototype was for SVC_RECONFIG_REQUEST_TIMEOUT_MS() instead
> include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting prototype for intel_svc_done(). Prototype was for stratix10_svc_done() instead
> include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting prototype for Service layer driver supports client names(). Prototype was for SVC_CLIENT_FPGA() instead
> include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
> include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RECONFIG_FLAG_PARTIAL() instead
> include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting prototype for Timeout settings for service clients(). Prototype was for SVC_RECONFIG_REQUEST_TIMEOUT_MS() instead
> include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting prototype for intel_svc_done(). Prototype was for stratix10_svc_done() instead
> include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting prototype for Service layer driver supports client names(). Prototype was for SVC_CLIENT_FPGA() instead
> include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
> include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RECONFIG_FLAG_PARTIAL() instead
> include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting prototype for Timeout settings for service clients(). Prototype was for SVC_RECONFIG_REQUEST_TIMEOUT_MS() instead
> include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting prototype for intel_svc_done(). Prototype was for stratix10_svc_done() instead
> include/linux/firmware/intel/stratix10-svc-client.h:15: warning: expecting prototype for Service layer driver supports client names(). Prototype was for SVC_CLIENT_FPGA() instead
> include/linux/firmware/intel/stratix10-svc-client.h:45: warning: expecting prototype for in bit number(). Prototype was for SVC_STATUS_OK() instead
> include/linux/firmware/intel/stratix10-svc-client.h:59: warning: expecting prototype for Flag bit for COMMAND_RECONFIG(). Prototype was for COMMAND_RECONFIG_FLAG_PARTIAL() instead
> include/linux/firmware/intel/stratix10-svc-client.h:66: warning: expecting prototype for Timeout settings for service clients(). Prototype was for SVC_RECONFIG_REQUEST_TIMEOUT_MS() instead
> include/linux/firmware/intel/stratix10-svc-client.h:228: warning: expecting prototype for intel_svc_done(). Prototype was for stratix10_svc_done() instead
> include/linux/memblock.h:292: warning: expecting prototype for for_each_free_mem_range_in_zone(). Prototype was for for_each_free_mem_pfn_range_in_zone() instead
> include/linux/memblock.h:308: warning: expecting prototype for for_each_free_mem_range_in_zone_from(). Prototype was for for_each_free_mem_pfn_range_in_zone_from() instead
> drivers/rapidio/rio.c:758: warning: expecting prototype for rio_unmap_inb_region(). Prototype was for rio_unmap_outb_region() instead
> include/linux/w1.h:292: warning: expecting prototype for module_w1_driver(). Prototype was for module_w1_family() instead
> drivers/rapidio/rio.c:758: warning: expecting prototype for rio_unmap_inb_region(). Prototype was for rio_unmap_outb_region() instead
> fs/dcache.c:477: warning: expecting prototype for d_drop(). Prototype was for ___d_drop() instead
> fs/dcache.c:1014: warning: expecting prototype for d_find_alias(). Prototype was for __d_find_alias() instead
> fs/inode.c:1517: warning: expecting prototype for find_inode_by_rcu(). Prototype was for find_inode_by_ino_rcu() instead
> fs/inode.c:1792: warning: expecting prototype for touch_atime(). Prototype was for atime_needs_update() instead
> fs/super.c:1728: warning: expecting prototype for thaw_super(). Prototype was for thaw_super_locked() instead
> fs/seq_file.c:1056: warning: expecting prototype for seq_hlist_start_precpu(). Prototype was for seq_hlist_start_percpu() instead
> drivers/parport/share.c:280: warning: expecting prototype for parport_register_driver(). Prototype was for __parport_register_driver() instead
> lib/crc7.c:66: warning: expecting prototype for crc7(). Prototype was for crc7_be() instead
> 
> Exposed by commit
> 
>   52042e2db452 ("scripts: kernel-doc: validate kernel-doc markup with the actual names")

Having some extra warnings were already expected ;-)

The problem is that a kernel-doc markup like:

	/**
	 * foo() - some desciption
	 */
	void bar(void) {}

Produces:

	.. c:function:: void bar (void)

	   some desciption

	**Parameters**

	``void``
	  no argument

In other words, kernel-doc documents function "bar()", using the text
from the function "foo()" markup.

While, on several cases, this is what it was expected, we've got several
problems already, where some other function was added between
the kernel-doc markup and the function it documents, causing
troubles on its documentation.

So, we added a kernel-doc warning to let the developers to know
that the function documented has a different name on its kernel-doc
markup.

Thanks,
Mauro
