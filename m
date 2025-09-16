Return-Path: <linux-next+bounces-8330-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D491B595E0
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 14:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5F6A1663D6
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 12:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5017246BD2;
	Tue, 16 Sep 2025 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYaO5F2y"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE9F1C695;
	Tue, 16 Sep 2025 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025052; cv=none; b=j+oKPo4Dp8mgtay8/izo/HHp9IosYHXbt/S2BY3PXehpjb+lStZodbRlBXIUqmEPAdW5X0k/wajOHhuiFnFgw/Aus99pCpIBQ87m9zAMOk9peo7ijOx6MPkBEUPMYIXMvZLuqa7GsnZ9TADjcCceX/wlz/UldgRcDCveNnZ0fqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025052; c=relaxed/simple;
	bh=RLqYYazD/iAO1IRLQJ9VCcBMtighzOGzz1bZkEbf/zU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=re4vEzOOUUqNZpMtl+RD/oEEpnOlAdve7KLeD9Em0dBweOOq3HBAMXBiaVCR6dZdqYliEutRXZegu31IuHorNI8MWq0ssOrDgNf1sQZo9RwLgcfmTi9hF08SyIXheF59n5kQ/GwXMpW9b6aTQGnaxu/N2mtlV+wnmyDEnhAeFeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYaO5F2y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBDDC4CEEB;
	Tue, 16 Sep 2025 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758025052;
	bh=RLqYYazD/iAO1IRLQJ9VCcBMtighzOGzz1bZkEbf/zU=;
	h=Date:From:To:Cc:Subject:From;
	b=AYaO5F2yyyg52dHqox76ZO/6p9j1S0zL0Ofam/qIwr76X0n+Eyo7fqeME/efmX1Ct
	 ngJKjXLiFxhIT4GS/Q5Hh+3EAnBm6IYu5lKv+Jkatk6T4KzCzU1fwesdjUGfAyhq1V
	 gvUm0YwLVgtqGX7IYQh4xSuktpSJKcawEXgb9Cyh2qRKvgJA+lrQmpVTVWxgE91wnB
	 kPxqeTCySJbswhdwe8dc6SSiAfs09ee70qKYZ4OafsEmLyyMJj0ffRJhpZ2b8HAEbe
	 BRFmSF1OEVS7STREcjkkbbZnE/ZfJ8DxmMEPo+TIvWs7hnwiQF0Ha+bcNtRYvzDAzS
	 eAQztRGXoHTiQ==
Date: Tue, 16 Sep 2025 13:17:28 +0100
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <aMlVWGqpKQRqB1_j@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7UrL9ffD06Lmv2nZ"
Content-Disposition: inline


--7UrL9ffD06Lmv2nZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vhost tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/vhost/net.c: In function 'handle_tx_copy':
/tmp/next/build/drivers/vhost/net.c:855:1: error: expected 'while' before 'static'
  855 | static void handle_tx_zerocopy(struct vhost_net *net, struct socket *sock)
      | ^~~~~~
/tmp/next/build/drivers/vhost/net.c:964:13: error: invalid storage class for function 'handle_tx'
  964 | static void handle_tx(struct vhost_net *net)
      |             ^~~~~~~~~
/tmp/next/build/drivers/vhost/net.c: In function 'handle_tx':
/tmp/next/build/drivers/vhost/net.c:982:17: error: implicit declaration of function 'handle_tx_zerocopy'; did you mean 'handle_tx_copy'? [-Wimplicit-function-declaration]
  982 |                 handle_tx_zerocopy(net, sock);
      |                 ^~~~~~~~~~~~~~~~~~
      |                 handle_tx_copy
/tmp/next/build/drivers/vhost/net.c: In function 'handle_tx_copy':
/tmp/next/build/drivers/vhost/net.c:990:12: error: invalid storage class for function 'peek_head_len'
  990 | static int peek_head_len(struct vhost_net_virtqueue *rvq, struct sock *sk)
      |            ^~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1011:12: error: invalid storage class for function 'vhost_net_rx_peek_head_len'
 1011 | static int vhost_net_rx_peek_head_len(struct vhost_net *net, struct sock *sk,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1043:12: error: invalid storage class for function 'get_rx_bufs'
 1043 | static int get_rx_bufs(struct vhost_net_virtqueue *nvq,
      |            ^~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1126:13: error: invalid storage class for function 'handle_rx'
 1126 | static void handle_rx(struct vhost_net *net)
      |             ^~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1281:13: error: invalid storage class for function 'handle_tx_kick'
 1281 | static void handle_tx_kick(struct vhost_work *work)
      |             ^~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1290:13: error: invalid storage class for function 'handle_rx_kick'
 1290 | static void handle_rx_kick(struct vhost_work *work)
      |             ^~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1299:13: error: invalid storage class for function 'handle_tx_net'
 1299 | static void handle_tx_net(struct vhost_work *work)
      |             ^~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1306:13: error: invalid storage class for function 'handle_rx_net'
 1306 | static void handle_rx_net(struct vhost_work *work)
      |             ^~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1313:12: error: invalid storage class for function 'vhost_net_open'
 1313 | static int vhost_net_open(struct inode *inode, struct file *f)
      |            ^~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1381:23: error: invalid storage class for function 'vhost_net_stop_vq'
 1381 | static struct socket *vhost_net_stop_vq(struct vhost_net *n,
      |                       ^~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1398:13: error: invalid storage class for function 'vhost_net_stop'
 1398 | static void vhost_net_stop(struct vhost_net *n, struct socket **tx_sock,
      |             ^~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1405:13: error: invalid storage class for function 'vhost_net_flush'
 1405 | static void vhost_net_flush(struct vhost_net *n)
      |             ^~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1421:12: error: invalid storage class for function 'vhost_net_release'
 1421 | static int vhost_net_release(struct inode *inode, struct file *f)
      |            ^~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1449:23: error: invalid storage class for function 'get_raw_socket'
 1449 | static struct socket *get_raw_socket(int fd)
      |                       ^~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1473:25: error: invalid storage class for function 'get_tap_ptr_ring'
 1473 | static struct ptr_ring *get_tap_ptr_ring(struct file *file)
      |                         ^~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1487:23: error: invalid storage class for function 'get_tap_socket'
 1487 | static struct socket *get_tap_socket(int fd)
      |                       ^~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1503:23: error: invalid storage class for function 'get_socket'
 1503 | static struct socket *get_socket(int fd)
      |                       ^~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1519:13: error: invalid storage class for function 'vhost_net_set_backend'
 1519 | static long vhost_net_set_backend(struct vhost_net *n, unsigned index, int fd)
      |             ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1620:13: error: invalid storage class for function 'vhost_net_reset_owner'
 1620 | static long vhost_net_reset_owner(struct vhost_net *n)
      |             ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1650:12: error: invalid storage class for function 'vhost_net_set_features'
 1650 | static int vhost_net_set_features(struct vhost_net *n, const u64 *features)
      |            ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1701:13: error: invalid storage class for function 'vhost_net_set_owner'
 1701 | static long vhost_net_set_owner(struct vhost_net *n)
      |             ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1722:13: error: invalid storage class for function 'vhost_net_ioctl'
 1722 | static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
      |             ^~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1821:16: error: invalid storage class for function 'vhost_net_chr_read_iter'
 1821 | static ssize_t vhost_net_chr_read_iter(struct kiocb *iocb, struct iov_iter *to)
      |                ^~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1831:16: error: invalid storage class for function 'vhost_net_chr_write_iter'
 1831 | static ssize_t vhost_net_chr_write_iter(struct kiocb *iocb,
      |                ^~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1841:17: error: invalid storage class for function 'vhost_net_chr_poll'
 1841 | static __poll_t vhost_net_chr_poll(struct file *file, poll_table *wait)
      |                 ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1851:27: error: initializer element is not constant
 1851 |         .release        = vhost_net_release,
      |                           ^~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1851:27: note: (near initialization for 'vhost_net_fops.release')
/tmp/next/build/drivers/vhost/net.c:1852:27: error: initializer element is not constant
 1852 |         .read_iter      = vhost_net_chr_read_iter,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1852:27: note: (near initialization for 'vhost_net_fops.read_iter')
/tmp/next/build/drivers/vhost/net.c:1853:27: error: initializer element is not constant
 1853 |         .write_iter     = vhost_net_chr_write_iter,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1853:27: note: (near initialization for 'vhost_net_fops.write_iter')
/tmp/next/build/drivers/vhost/net.c:1854:27: error: initializer element is not constant
 1854 |         .poll           = vhost_net_chr_poll,
      |                           ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1854:27: note: (near initialization for 'vhost_net_fops.poll')
/tmp/next/build/drivers/vhost/net.c:1855:27: error: initializer element is not constant
 1855 |         .unlocked_ioctl = vhost_net_ioctl,
      |                           ^~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1855:27: note: (near initialization for 'vhost_net_fops.unlocked_ioctl')
/tmp/next/build/drivers/vhost/net.c:1857:27: error: initializer element is not constant
 1857 |         .open           = vhost_net_open,
      |                           ^~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1857:27: note: (near initialization for 'vhost_net_fops.open')
/tmp/next/build/drivers/vhost/net.c:1867:19: error: invalid storage class for function 'vhost_net_init'
 1867 | static int __init vhost_net_init(void)
      |                   ^~~~~~~~~~~~~~
In file included from /tmp/next/build/include/linux/device/driver.h:21,
                 from /tmp/next/build/include/linux/device.h:32,
                 from /tmp/next/build/include/linux/virtio.h:9,
                 from /tmp/next/build/include/linux/virtio_config.h:7,
                 from /tmp/next/build/include/uapi/linux/vhost_types.h:16,
                 from /tmp/next/build/include/uapi/linux/vhost.h:14,
                 from /tmp/next/build/drivers/vhost/net.c:10:
/tmp/next/build/include/linux/module.h:132:49: error: invalid storage class for function '__inittest'
  132 |         static inline initcall_t __maybe_unused __inittest(void)                \
      |                                                 ^~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1873:1: note: in expansion of macro 'module_init'
 1873 | module_init(vhost_net_init);
      | ^~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1873:1: error: 'alias' attribute ignored [-Werror=attributes]
/tmp/next/build/drivers/vhost/net.c:1875:20: error: invalid storage class for function 'vhost_net_exit'
 1875 | static void __exit vhost_net_exit(void)
      |                    ^~~~~~~~~~~~~~
/tmp/next/build/include/linux/module.h:140:49: error: invalid storage class for function '__exittest'
  140 |         static inline exitcall_t __maybe_unused __exittest(void)                \
      |                                                 ^~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1879:1: note: in expansion of macro 'module_exit'
 1879 | module_exit(vhost_net_exit);
      | ^~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:1879:1: error: 'alias' attribute ignored [-Werror=attributes]
/tmp/next/build/drivers/vhost/net.c:1886:1: error: expected declaration or statement at end of input
 1886 | MODULE_ALIAS("devname:vhost-net");
      | ^~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c: At top level:
/tmp/next/build/drivers/vhost/net.c:620:13: error: 'vhost_exceeds_maxpend' defined but not used [-Werror=unused-function]
  620 | static bool vhost_exceeds_maxpend(struct vhost_net *net)
      |             ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:340:13: error: 'vhost_net_tx_select_zcopy' defined but not used [-Werror=unused-function]
  340 | static bool vhost_net_tx_select_zcopy(struct vhost_net *net)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/vhost/net.c:326:13: error: 'vhost_net_tx_packet' defined but not used [-Werror=unused-function]
  326 | static void vhost_net_tx_packet(struct vhost_net *net)
      |             ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[5]: *** [/tmp/next/build/scripts/Makefile.build:287: drivers/vhost/net.o] Error 1
make[4]: *** [/tmp/next/build/scripts/Makefile.build:556: drivers/vhost] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/tmp/next/build/scripts/Makefile.build:556: drivers] Error 2
make[2]: *** [/tmp/next/build/Makefile:2010: .] Error 2
make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Command exited with non-zero status 2
16291.57user 1243.39system 1:51.12elapsed 15780%CPU (0avgtext+0avgdata 1397196maxresident)k
0inputs+0outputs (4572major+208444472minor)pagefaults 0swaps

Caused by commit

   41bafbdcd27bf ("vhost-net: flush batched before enabling notifications")

I have used the tree from 20250915 instead.

--7UrL9ffD06Lmv2nZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJVVcACgkQJNaLcl1U
h9B0iAf/QOKTOhkW9iFTHrUEdXSAPXuwVV3kwTSBoHBRlZilrNxrIKSHxtEAmDFe
AiRbNT4tzSFbCtuaynU1DdtZ/lKhRDbFz10bpu+09KWmQMxxKVczFZ1wTaWZBry8
+Ul8Lvct8TIoGe28HiR0o1kxd+BzfNzJqyt6Z5aHMyRU/7Dk+OEaGSnxYNiy20I2
+dVZ59rLr0ETl2y7qR8S6MOh84gFO2XkOSLe0QYXkTVKCpTDMvVBhMUzs4QHxb0e
iE5VKqB3n2w2t2GHtKOZU0+6tfu7soPaT/aI3G2FQPeNhGAkll/69L1xfWFDls+I
3hZk2SNMZkybmGX7AnngUysOWG6zDg==
=/+MA
-----END PGP SIGNATURE-----

--7UrL9ffD06Lmv2nZ--

