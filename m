Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32577287A12
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 18:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgJHQjb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 12:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35267 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728551AbgJHQj3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 12:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602175167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J9qYAierbVYrD4kZyI2nIgIqlbwIReYQoycMbbbHP0I=;
        b=BUuRInHtc6cpGWuNsYxLolZasm838pnbDWYDaQoLW27D2dwbpTZzSDMBkpHvevgWRcXDck
        4wilq9kcXfoi14tiO+YNno63d3DMjsnKl1XPrejjMBRun/ZEVbMWz7CABduHvM4HfY8fe6
        JuWG4EjUMTFoLQN00OFchJR773rEbpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-sx53bJcgMRWYuQ9WHrCSQQ-1; Thu, 08 Oct 2020 12:39:25 -0400
X-MC-Unique: sx53bJcgMRWYuQ9WHrCSQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A8C710BBEC3;
        Thu,  8 Oct 2020 16:39:24 +0000 (UTC)
Received: from ovpn-66-175.rdu2.redhat.com (unknown [10.10.67.175])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DEE7319C4F;
        Thu,  8 Oct 2020 16:39:22 +0000 (UTC)
Message-ID: <9dcf9f7a9005d5c5885fe8c5dcd4314d04dc9caf.camel@redhat.com>
Subject: Re: misc I/O submission cleanups
From:   Qian Cai <cai@redhat.com>
To:     Christoph Hellwig <hch@lst.de>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-scsi@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Hannes Reinecke <hare@suse.de>,
        Bart Van Assche <bvanassche@acm.org>
Date:   Thu, 08 Oct 2020 12:39:22 -0400
In-Reply-To: <20201005084130.143273-1-hch@lst.de>
References: <20201005084130.143273-1-hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-10-05 at 10:41 +0200, Christoph Hellwig wrote:
> Hi Martin,
> 
> this series tidies up various loose ends in the SCSI I/O submission path.

Reverting this patchset on the top of today's linux-next fixed the boot failures
below with libata, i.e.,

git revert --no-edit 653eb7c99d84..ed7fb2d018fd

== Easy to reproduce using qemu-kvm "-hda" CONFIG_ATA_PIIX=y. ==
.config: https://gitlab.com/cailca/linux-mm/-/blob/master/x86.config

[   46.047499][  T757] ata2.00: WARNING: zero len r/w req
[   46.049734][  T644] ata2.00: WARNING: zero len r/w req
[   46.051962][  T757] ata2.00: WARNING: zero len r/w req
[   46.054182][  T644] ata2.00: WARNING: zero len r/w req
[   46.058018][  T757] ata2.00: WARNING: zero len r/w req
[   46.060514][  T644] ata2.00: WARNING: zero len r/w req
[   46.065764][  T757] ata2.00: WARNING: zero len r/w req
[   46.068005][  T644] ata2.00: WARNING: zero len r/w req
[   46.070192][  T644] ata2.00: WARNING: zero len r/w req
[   46.072379][  T644] ata2.00: WARNING: zero len r/w req
[   46.074629][  T644] ata2.00: WARNING: zero len r/w req
[   46.077255][  T644] ata2.00: WARNING: zero len r/w req
[   46.081553][   C36] sr 1:0:0:0: [sr0] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
[   46.086336][   C36] sr 1:0:0:0: [sr0] tag#0 CDB: opcode=0x28 
[   46.089171][   C36] blk_update_request: I/O error, dev sr0, sector 2097136 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
[   46.094979][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.097526][  T757] blk_update_request: I/O error, dev sr0, sector 2097136 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[   46.102364][  T757] Buffer I/O error on dev sr0, logical block 2097136, async page read
[   46.106080][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.108590][  T757] blk_update_request: I/O error, dev sr0, sector 2097137 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[   46.113234][  T757] Buffer I/O error on dev sr0, logical block 2097137, async page read
[   46.117053][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.119581][  T757] blk_update_request: I/O error, dev sr0, sector 2097138 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[   46.124382][  T757] Buffer I/O error on dev sr0, logical block 2097138, async page read
[   46.128545][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.131038][  T757] blk_update_request: I/O error, dev sr0, sector 2097139 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[   46.135905][  T757] Buffer I/O error on dev sr0, logical block 2097139, async page read
[   46.139835][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.142422][  T757] blk_update_request: I/O error, dev sr0, sector 2097140 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[   46.147240][  T757] Buffer I/O error on dev sr0, logical block 2097140, async page read
[   46.150764][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.153248][  T757] blk_update_request: I/O error, dev sr0, sector 2097141 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[   46.158439][  T757] Buffer I/O error on dev sr0, logical block 2097141, async page read
[   46.162383][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.165062][  T757] blk_update_request: I/O error, dev sr0, sector 2097142 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[   46.169785][  T757] Buffer I/O error on dev sr0, logical block 2097142, async page read
[   46.173252][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.175968][  T757] blk_update_request: I/O error, dev sr0, sector 2097143 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[   46.181049][  T757] Buffer I/O error on dev sr0, logical block 2097143, async page read
[   46.184779][   C36] sr 1:0:0:0: [sr0] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
[   46.188966][   C36] sr 1:0:0:0: [sr0] tag#0 CDB: opcode=0x28 
[   46.191731][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.194223][  T757] Buffer I/O error on dev sr0, logical block 0, async page read
[   46.197976][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.200781][  T757] Buffer I/O error on dev sr0, logical block 1, async page read
[   46.204221][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.207133][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.209790][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer
[   46.212464][  T757] sr 1:0:0:0: [sr0] tag#0 unaligned transfer

== baremetal with ahci ==
[   14.560235][  T515] ata1.00: WARNING: zero len r/w req
[   14.560397][  T515] ata1.00: WARNING: zero len r/w req
[   14.560450][  T515] ata1.00: WARNING: zero len r/w req
[   14.560502][  T515] ata1.00: WARNING: zero len r/w req
[   14.560594][  T515] ata1.00: WARNING: zero len r/w req
[   14.560644][  T515] ata1.00: WARNING: zero len r/w req
[   14.560709][  C100] sd 0:0:0:0: [sdb] tag#7 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
[   14.560790][  C100] sd 0:0:0:0: [sdb] tag#7 CDB: opcode=0x35 35 00 00 00 00 00 00 00 00 00
[   14.560869][  C100] blk_update_request: I/O error, dev sdb, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
[   14.562124][ T1274] ata1.00: WARNING: zero len r/w req
[   14.562172][ T1274] ata1.00: WARNING: zero len r/w req
[   14.562217][ T1274] ata1.00: WARNING: zero len r/w req
[   14.562262][ T1274] ata1.00: WARNING: zero len r/w req
[   14.562317][ T1274] ata1.00: WARNING: zero len r/w req
[   14.562361][ T1274] ata1.00: WARNING: zero len r/w req
[   14.562412][  C100] sd 0:0:0:0: [sdb] tag#8 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
[   14.562465][  C100] sd 0:0:0:0: [sdb] tag#8 CDB: opcode=0x35 35 00 00 00 00 00 00 00 00 00
[   14.562517][  C100] blk_update_request: I/O error, dev sdb, sector 1880188816 op 0x1:(WRITE) flags 0x9800 phys_seg 1 prio class 0


