Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B76686D73
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 00:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732796AbfHHWxY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 18:53:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44460 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732375AbfHHWxY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 18:53:24 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x78MpQ3U084092
        for <linux-next@vger.kernel.org>; Thu, 8 Aug 2019 18:53:23 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2u8th0dbtp-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2019 18:53:22 -0400
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
        Thu, 8 Aug 2019 23:53:21 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 8 Aug 2019 23:53:18 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x78MrIQO48955434
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 8 Aug 2019 22:53:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 098F711C050;
        Thu,  8 Aug 2019 22:53:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C231D11C04A;
        Thu,  8 Aug 2019 22:53:17 +0000 (GMT)
Received: from osiris (unknown [9.145.86.197])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu,  8 Aug 2019 22:53:17 +0000 (GMT)
Date:   Fri, 9 Aug 2019 00:53:16 +0200
From:   Heiko Carstens <heiko.carstens@de.ibm.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Aug 8
References: <20190808181739.62f257ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808181739.62f257ed@canb.auug.org.au>
X-TM-AS-GCONF: 00
x-cbid: 19080822-0016-0000-0000-0000029C76DA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080822-0017-0000-0000-000032FC7C96
Message-Id: <20190808225316.GA3725@osiris>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-08_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908080204
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 08, 2019 at 06:17:39PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190807:
> 
> I reverted a commit from the kbuild-current tree by request.

Hello Masahiro,

it looks like there is (another?) bug in kbuild. With your patch

commit 421a15c167b2d1f43f287da5b75ef2704650640b (refs/bisect/bad)
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri Jul 26 11:17:47 2019 +0900

    kbuild: clean-up subdir-ym computation

    The intermediate variables __subdir-{y,m} are unneeded.

    Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

the file modules.builtin starts to miss a lot of entries when building
the kernel tree. Reverting that patch on top of linux-next 20190808
restores the old behaviour.

This is the diff I get without and with the above commit (s390 with
defconfig):

--- modules.builtin.ok	2019-08-09 00:39:58.148624485 +0200
+++ modules.builtin	2019-08-09 00:40:07.878637541 +0200
@@ -1,5 +1,3 @@
-arch/s390/crypto/crc32-vx_s390.ko
-arch/s390/net/pnet.ko
 kernel/configs.ko
 mm/zpool.ko
 fs/binfmt_script.ko
@@ -46,67 +44,19 @@
 crypto/jitterentropy_rng.ko
 crypto/ghash-generic.ko
 crypto/xor.ko
-crypto/asymmetric_keys/public_key.ko
-crypto/asymmetric_keys/x509_key_parser.ko
-crypto/asymmetric_keys/pkcs7_message.ko
 block/mq-deadline.ko
 block/kyber-iosched.ko
 block/bfq.ko
-drivers/base/firmware_loader/firmware_class.ko
-drivers/block/brd.ko
-drivers/block/virtio_blk.ko
-drivers/char/virtio_console.ko
-drivers/char/tpm/tpm.ko
 drivers/connector/cn.ko
 drivers/dax/dax.ko
-drivers/gpu/drm/drm_kms_helper.ko
-drivers/gpu/drm/drm.ko
-drivers/gpu/drm/drm_panel_orientation_quirks.ko
-drivers/gpu/drm/ttm/ttm.ko
-drivers/gpu/drm/virtio/virtio-gpu.ko
-drivers/i2c/i2c-core.ko
-drivers/i2c/algos/i2c-algo-bit.ko
 drivers/input/input-core.ko
 drivers/input/evdev.ko
-drivers/md/md-mod.ko
-drivers/scsi/scsi_mod.ko
-drivers/scsi/scsi_transport_fc.ko
-drivers/scsi/sd_mod.ko
-drivers/scsi/sg.ko
-drivers/video/fbdev/core/fb.ko
-drivers/video/fbdev/core/cfbfillrect.ko
-drivers/video/fbdev/core/cfbcopyarea.ko
-drivers/video/fbdev/core/cfbimgblt.ko
-drivers/video/fbdev/core/sysfillrect.ko
-drivers/video/fbdev/core/syscopyarea.ko
-drivers/video/fbdev/core/sysimgblt.ko
-drivers/video/fbdev/core/fb_sys_fops.ko
 drivers/virtio/virtio.ko
 drivers/virtio/virtio_ring.ko
 drivers/virtio/virtio_input.ko
-drivers/watchdog/watchdog.ko
-drivers/s390/block/dasd_mod.ko
-drivers/s390/block/dasd_diag_mod.ko
-drivers/s390/block/dasd_eckd_mod.ko
-drivers/s390/block/dasd_fba_mod.ko
-drivers/s390/char/raw3270.ko
-drivers/s390/char/tty3270.ko
-drivers/s390/char/fs3270.ko
-drivers/s390/cio/chsc_sch.ko
-drivers/s390/cio/ccwgroup.ko
-drivers/s390/cio/qdio.ko
-drivers/s390/net/qeth.ko
-drivers/s390/net/qeth_l2.ko
-drivers/s390/net/qeth_l3.ko
-drivers/s390/scsi/zfcp.ko
 net/dns_resolver/dns_resolver.ko
-net/ipv4/tcp_cubic.ko
-net/ipv6/ipv6.ko
-net/ipv6/inet6_hashtables.ko
 net/iucv/iucv.ko
 net/packet/af_packet.ko
-net/sched/cls_cgroup.ko
-net/unix/unix.ko
 lib/bitrev.ko
 lib/crc16.ko
 lib/crc-t10dif.ko
@@ -117,7 +67,6 @@
 lib/digsig.ko
 lib/asn1_decoder.ko
 lib/oid_registry.ko
-lib/crypto/libaes.ko
 lib/fonts/font.ko
 lib/lz4/lz4_decompress.ko
 lib/lzo/lzo_compress.ko

