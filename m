Return-Path: <linux-next+bounces-2648-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9749155A3
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 19:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14FAEB20C02
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 17:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDB1199C2;
	Mon, 24 Jun 2024 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouWasdT+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0457917BCB;
	Mon, 24 Jun 2024 17:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719251143; cv=none; b=Cod8XSqS5LZACzDo3ybJBQgg/jPmn2+iKXkXUTfkhQ+c65QyMxdwqpgBoXIpvKOGrg65MeMaQ20saDcokZuYLxhS6IYm6o5buQBYDDjxJ+Ii4XVTE5CLH4047iYXCPqQ34yY8A4yW+yzOP0WNCa44onwOTzXngH5DGWVGwTXbFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719251143; c=relaxed/simple;
	bh=RVtAJ5mBWRR0Z+jli4rkw9DX+U0glNbllbhGyF3zMPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRxvmf6LWi75EC9RyJRDM8igfVTKpHZgJRaCavF4uWG+rutVCK34fdAV1wdTt6yYLgcX14fvn0o2dM86AOoQxCuJXy3IDDplRbtauBtsDSRKao99lr6Z1V6cmoLhc1CMwIOEuvDOKRUExbrW7I+QCIeBIJlEEAHy9xRIaLmySrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouWasdT+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47F8C2BBFC;
	Mon, 24 Jun 2024 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719251142;
	bh=RVtAJ5mBWRR0Z+jli4rkw9DX+U0glNbllbhGyF3zMPM=;
	h=Date:From:To:Cc:Subject:From;
	b=ouWasdT+NVSNVrzE/nNWdDCHIgffO2Nywbhx2Obvi5piO7YSn7RiB50aNdHJkx2oB
	 0+X1jWO0FTDWpBMpVKRyl4vrhuiIlg7cYEIHDl/urQsSrxerW0GV5byhaZ9AYRnajL
	 6rOa7siAVPK9/bTx7sLQNh9QK4KxfvEc43TA0UWYH9qlPq1OWecARMi5pN95FcpomA
	 AMcvW6QWfKaXiBHCv4cwHmaHRVG5T3SH/8w8z94RiruarVEfvnYcz1uaiVRVnBgwW3
	 XZym5T2+V/fz85wMyoiIyVFjyAVQEDDS1/eAQ/vNo6DnlSnDBjcfWvjuzUBPMY8B+X
	 Uc3qYdu72RDqw==
Date: Mon, 24 Jun 2024 18:45:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Tony Lindgren <tony.lindgren@linux.intel.com>
Subject: linux-next: manual merge of the tty tree with the printk tree
Message-ID: <ZnmwwfMH50s9LiT5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DC1J995vhGFiO/gP"
Content-Disposition: inline


--DC1J995vhGFiO/gP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/serial/8250/8250_core.c

between commit:

  b70dc67cceb97 ("serial: core: Revert unusable console quirk handling")

=66rom the printk tree and commit:

  ffd8e8bd26e94 ("serial: 8250: Extract platform driver")

=66rom the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I'm not sure git rerere will do the right thing with this one...

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/=
8250_core.c
index 44f7cc56ff70d..5f9f06911795c 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -6,11 +6,9 @@
  *
  *  Copyright (C) 2001 Russell King.
  *
- *  Supports: ISA-compatible 8250/16550 ports
- *	      PNP 8250/16550 ports
+ *  Supports:
  *	      early_serial_setup() ports
  *	      userspace-configurable "phantom" ports
- *	      "serial8250" platform devices
  *	      serial8250_register_8250_port() ports
  */
=20
@@ -35,52 +33,13 @@
 #include <linux/string_helpers.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
-#ifdef CONFIG_SPARC
-#include <linux/sunserialcore.h>
-#endif
=20
 #include <asm/irq.h>
=20
 #include "8250.h"
=20
-/*
- * Configuration:
- *   share_irqs - whether we pass IRQF_SHARED to request_irq().  This opti=
on
- *                is unsafe when used on edge-triggered interrupts.
- */
-static unsigned int share_irqs =3D SERIAL8250_SHARE_IRQS;
-
-static unsigned int nr_uarts =3D CONFIG_SERIAL_8250_RUNTIME_UARTS;
-
-static struct uart_driver serial8250_reg;
-
-static unsigned int skip_txen_test; /* force skip of txen test at init tim=
e */
-
 #define PASS_LIMIT	512
=20
-#include <asm/serial.h>
-/*
- * SERIAL_PORT_DFNS tells us about built-in ports that have no
- * standard enumeration mechanism.   Platforms that can find all
- * serial ports via mechanisms like ACPI or PCI need not supply it.
- */
-#ifndef SERIAL_PORT_DFNS
-#define SERIAL_PORT_DFNS
-#endif
-
-static const struct old_serial_port old_serial_port[] =3D {
-	SERIAL_PORT_DFNS /* defined in asm/serial.h */
-};
-
-#define UART_NR	CONFIG_SERIAL_8250_NR_UARTS
-
-#ifdef CONFIG_SERIAL_8250_RSA
-
-#define PORT_RSA_MAX 4
-static unsigned long probe_rsa[PORT_RSA_MAX];
-static unsigned int probe_rsa_count;
-#endif /* CONFIG_SERIAL_8250_RSA  */
-
 struct irq_info {
 	struct			hlist_node node;
 	int			irq;
@@ -345,45 +304,8 @@ static void univ8250_release_irq(struct uart_8250_port=
 *up)
 		serial_unlink_irq_chain(up);
 }
=20
-#ifdef CONFIG_SERIAL_8250_RSA
-static int serial8250_request_rsa_resource(struct uart_8250_port *up)
-{
-	unsigned long start =3D UART_RSA_BASE << up->port.regshift;
-	unsigned int size =3D 8 << up->port.regshift;
-	struct uart_port *port =3D &up->port;
-	int ret =3D -EINVAL;
-
-	switch (port->iotype) {
-	case UPIO_HUB6:
-	case UPIO_PORT:
-		start +=3D port->iobase;
-		if (request_region(start, size, "serial-rsa"))
-			ret =3D 0;
-		else
-			ret =3D -EBUSY;
-		break;
-	}
-
-	return ret;
-}
-
-static void serial8250_release_rsa_resource(struct uart_8250_port *up)
-{
-	unsigned long offset =3D UART_RSA_BASE << up->port.regshift;
-	unsigned int size =3D 8 << up->port.regshift;
-	struct uart_port *port =3D &up->port;
-
-	switch (port->iotype) {
-	case UPIO_HUB6:
-	case UPIO_PORT:
-		release_region(port->iobase + offset, size);
-		break;
-	}
-}
-#endif
-
-static const struct uart_ops *base_ops;
-static struct uart_ops univ8250_port_ops;
+const struct uart_ops *univ8250_port_base_ops =3D NULL;
+struct uart_ops univ8250_port_ops;
=20
 static const struct uart_8250_ops univ8250_driver_ops =3D {
 	.setup_irq	=3D univ8250_setup_irq,
@@ -411,85 +333,12 @@ struct uart_8250_port *serial8250_get_port(int line)
 }
 EXPORT_SYMBOL_GPL(serial8250_get_port);
=20
-static void (*serial8250_isa_config)(int port, struct uart_port *up,
-	u32 *capabilities);
-
-void serial8250_set_isa_configurator(
-	void (*v)(int port, struct uart_port *up, u32 *capabilities))
-{
-	serial8250_isa_config =3D v;
-}
-EXPORT_SYMBOL(serial8250_set_isa_configurator);
-
-#ifdef CONFIG_SERIAL_8250_RSA
-
-static void univ8250_config_port(struct uart_port *port, int flags)
-{
-	struct uart_8250_port *up =3D up_to_u8250p(port);
-
-	up->probe &=3D ~UART_PROBE_RSA;
-	if (port->type =3D=3D PORT_RSA) {
-		if (serial8250_request_rsa_resource(up) =3D=3D 0)
-			up->probe |=3D UART_PROBE_RSA;
-	} else if (flags & UART_CONFIG_TYPE) {
-		int i;
-
-		for (i =3D 0; i < probe_rsa_count; i++) {
-			if (probe_rsa[i] =3D=3D up->port.iobase) {
-				if (serial8250_request_rsa_resource(up) =3D=3D 0)
-					up->probe |=3D UART_PROBE_RSA;
-				break;
-			}
-		}
-	}
-
-	base_ops->config_port(port, flags);
-
-	if (port->type !=3D PORT_RSA && up->probe & UART_PROBE_RSA)
-		serial8250_release_rsa_resource(up);
-}
-
-static int univ8250_request_port(struct uart_port *port)
-{
-	struct uart_8250_port *up =3D up_to_u8250p(port);
-	int ret;
-
-	ret =3D base_ops->request_port(port);
-	if (ret =3D=3D 0 && port->type =3D=3D PORT_RSA) {
-		ret =3D serial8250_request_rsa_resource(up);
-		if (ret < 0)
-			base_ops->release_port(port);
-	}
-
-	return ret;
-}
-
-static void univ8250_release_port(struct uart_port *port)
-{
-	struct uart_8250_port *up =3D up_to_u8250p(port);
-
-	if (port->type =3D=3D PORT_RSA)
-		serial8250_release_rsa_resource(up);
-	base_ops->release_port(port);
-}
-
-static void univ8250_rsa_support(struct uart_ops *ops)
-{
-	ops->config_port  =3D univ8250_config_port;
-	ops->request_port =3D univ8250_request_port;
-	ops->release_port =3D univ8250_release_port;
-}
-
-#else
-#define univ8250_rsa_support(x)		do { } while (0)
-#endif /* CONFIG_SERIAL_8250_RSA */
-
 static inline void serial8250_apply_quirks(struct uart_8250_port *up)
 {
 	up->port.quirks |=3D skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
 }
=20
-static struct uart_8250_port *serial8250_setup_port(int index)
+struct uart_8250_port *serial8250_setup_port(int index)
 {
 	struct uart_8250_port *up;
=20
@@ -501,8 +350,8 @@ static struct uart_8250_port *serial8250_setup_port(int=
 index)
 	up->port.port_id =3D index;
=20
 	serial8250_init_port(up);
-	if (!base_ops)
-		base_ops =3D up->port.ops;
+	if (!univ8250_port_base_ops)
+		univ8250_port_base_ops =3D up->port.ops;
 	up->port.ops =3D &univ8250_port_ops;
=20
 	timer_setup(&up->timer, serial8250_timeout, 0);
@@ -514,57 +363,7 @@ static struct uart_8250_port *serial8250_setup_port(in=
t index)
 	return up;
 }
=20
-static void __init serial8250_isa_init_ports(void)
-{
-	struct uart_8250_port *up;
-	static int first =3D 1;
-	int i, irqflag =3D 0;
-
-	if (!first)
-		return;
-	first =3D 0;
-
-	if (nr_uarts > UART_NR)
-		nr_uarts =3D UART_NR;
-
-	/*
-	 * Set up initial isa ports based on nr_uart module param, or else
-	 * default to CONFIG_SERIAL_8250_RUNTIME_UARTS. Note that we do not
-	 * need to increase nr_uarts when setting up the initial isa ports.
-	 */
-	for (i =3D 0; i < nr_uarts; i++)
-		serial8250_setup_port(i);
-
-	/* chain base port ops to support Remote Supervisor Adapter */
-	univ8250_port_ops =3D *base_ops;
-	univ8250_rsa_support(&univ8250_port_ops);
-
-	if (share_irqs)
-		irqflag =3D IRQF_SHARED;
-
-	for (i =3D 0, up =3D serial8250_ports;
-	     i < ARRAY_SIZE(old_serial_port) && i < nr_uarts;
-	     i++, up++) {
-		struct uart_port *port =3D &up->port;
-
-		port->iobase   =3D old_serial_port[i].port;
-		port->irq      =3D irq_canonicalize(old_serial_port[i].irq);
-		port->irqflags =3D 0;
-		port->uartclk  =3D old_serial_port[i].baud_base * 16;
-		port->flags    =3D old_serial_port[i].flags;
-		port->hub6     =3D 0;
-		port->membase  =3D old_serial_port[i].iomem_base;
-		port->iotype   =3D old_serial_port[i].io_type;
-		port->regshift =3D old_serial_port[i].iomem_reg_shift;
-
-		port->irqflags |=3D irqflag;
-		if (serial8250_isa_config !=3D NULL)
-			serial8250_isa_config(i, &up->port, &up->capabilities);
-	}
-}
-
-static void __init
-serial8250_register_ports(struct uart_driver *drv, struct device *dev)
+void __init serial8250_register_ports(struct uart_driver *drv, struct devi=
ce *dev)
 {
 	int i;
=20
@@ -721,7 +520,7 @@ console_initcall(univ8250_console_init);
 #define SERIAL8250_CONSOLE	NULL
 #endif
=20
-static struct uart_driver serial8250_reg =3D {
+struct uart_driver serial8250_reg =3D {
 	.owner			=3D THIS_MODULE,
 	.driver_name		=3D "serial",
 	.dev_name		=3D "ttyS",
@@ -822,120 +621,6 @@ void serial8250_resume_port(int line)
 }
 EXPORT_SYMBOL(serial8250_resume_port);
=20
-/*
- * Register a set of serial devices attached to a platform device.  The
- * list is terminated with a zero flags entry, which means we expect
- * all entries to have at least UPF_BOOT_AUTOCONF set.
- */
-static int serial8250_probe(struct platform_device *dev)
-{
-	struct plat_serial8250_port *p =3D dev_get_platdata(&dev->dev);
-	struct uart_8250_port uart;
-	int ret, i, irqflag =3D 0;
-
-	memset(&uart, 0, sizeof(uart));
-
-	if (share_irqs)
-		irqflag =3D IRQF_SHARED;
-
-	for (i =3D 0; p && p->flags !=3D 0; p++, i++) {
-		uart.port.iobase	=3D p->iobase;
-		uart.port.membase	=3D p->membase;
-		uart.port.irq		=3D p->irq;
-		uart.port.irqflags	=3D p->irqflags;
-		uart.port.uartclk	=3D p->uartclk;
-		uart.port.regshift	=3D p->regshift;
-		uart.port.iotype	=3D p->iotype;
-		uart.port.flags		=3D p->flags;
-		uart.port.mapbase	=3D p->mapbase;
-		uart.port.mapsize	=3D p->mapsize;
-		uart.port.hub6		=3D p->hub6;
-		uart.port.has_sysrq	=3D p->has_sysrq;
-		uart.port.private_data	=3D p->private_data;
-		uart.port.type		=3D p->type;
-		uart.bugs		=3D p->bugs;
-		uart.port.serial_in	=3D p->serial_in;
-		uart.port.serial_out	=3D p->serial_out;
-		uart.dl_read		=3D p->dl_read;
-		uart.dl_write		=3D p->dl_write;
-		uart.port.handle_irq	=3D p->handle_irq;
-		uart.port.handle_break	=3D p->handle_break;
-		uart.port.set_termios	=3D p->set_termios;
-		uart.port.set_ldisc	=3D p->set_ldisc;
-		uart.port.get_mctrl	=3D p->get_mctrl;
-		uart.port.pm		=3D p->pm;
-		uart.port.dev		=3D &dev->dev;
-		uart.port.irqflags	|=3D irqflag;
-		ret =3D serial8250_register_8250_port(&uart);
-		if (ret < 0) {
-			dev_err(&dev->dev, "unable to register port at index %d "
-				"(IO%lx MEM%llx IRQ%d): %d\n", i,
-				p->iobase, (unsigned long long)p->mapbase,
-				p->irq, ret);
-		}
-	}
-	return 0;
-}
-
-/*
- * Remove serial ports registered against a platform device.
- */
-static void serial8250_remove(struct platform_device *dev)
-{
-	int i;
-
-	for (i =3D 0; i < nr_uarts; i++) {
-		struct uart_8250_port *up =3D &serial8250_ports[i];
-
-		if (up->port.dev =3D=3D &dev->dev)
-			serial8250_unregister_port(i);
-	}
-}
-
-static int serial8250_suspend(struct platform_device *dev, pm_message_t st=
ate)
-{
-	int i;
-
-	for (i =3D 0; i < UART_NR; i++) {
-		struct uart_8250_port *up =3D &serial8250_ports[i];
-
-		if (up->port.type !=3D PORT_UNKNOWN && up->port.dev =3D=3D &dev->dev)
-			uart_suspend_port(&serial8250_reg, &up->port);
-	}
-
-	return 0;
-}
-
-static int serial8250_resume(struct platform_device *dev)
-{
-	int i;
-
-	for (i =3D 0; i < UART_NR; i++) {
-		struct uart_8250_port *up =3D &serial8250_ports[i];
-
-		if (up->port.type !=3D PORT_UNKNOWN && up->port.dev =3D=3D &dev->dev)
-			serial8250_resume_port(i);
-	}
-
-	return 0;
-}
-
-static struct platform_driver serial8250_isa_driver =3D {
-	.probe		=3D serial8250_probe,
-	.remove_new	=3D serial8250_remove,
-	.suspend	=3D serial8250_suspend,
-	.resume		=3D serial8250_resume,
-	.driver		=3D {
-		.name	=3D "serial8250",
-	},
-};
-
-/*
- * This "device" covers _all_ ISA 8250-compatible serial devices listed
- * in the table in include/asm/serial.h
- */
-static struct platform_device *serial8250_isa_devs;
-
 /*
  * serial8250_register_8250_port and serial8250_unregister_port allows for
  * 16x50 serial ports to be configured at run-time, to support PCMCIA
@@ -1212,134 +897,5 @@ void serial8250_unregister_port(int line)
 }
 EXPORT_SYMBOL(serial8250_unregister_port);
=20
-static int __init serial8250_init(void)
-{
-	int ret;
-
-	if (nr_uarts =3D=3D 0)
-		return -ENODEV;
-
-	serial8250_isa_init_ports();
-
-	pr_info("Serial: 8250/16550 driver, %d ports, IRQ sharing %s\n",
-		nr_uarts, str_enabled_disabled(share_irqs));
-
-#ifdef CONFIG_SPARC
-	ret =3D sunserial_register_minors(&serial8250_reg, UART_NR);
-#else
-	serial8250_reg.nr =3D UART_NR;
-	ret =3D uart_register_driver(&serial8250_reg);
-#endif
-	if (ret)
-		goto out;
-
-	ret =3D serial8250_pnp_init();
-	if (ret)
-		goto unreg_uart_drv;
-
-	serial8250_isa_devs =3D platform_device_alloc("serial8250",
-						    PLAT8250_DEV_LEGACY);
-	if (!serial8250_isa_devs) {
-		ret =3D -ENOMEM;
-		goto unreg_pnp;
-	}
-
-	ret =3D platform_device_add(serial8250_isa_devs);
-	if (ret)
-		goto put_dev;
-
-	serial8250_register_ports(&serial8250_reg, &serial8250_isa_devs->dev);
-
-	ret =3D platform_driver_register(&serial8250_isa_driver);
-	if (ret =3D=3D 0)
-		goto out;
-
-	platform_device_del(serial8250_isa_devs);
-put_dev:
-	platform_device_put(serial8250_isa_devs);
-unreg_pnp:
-	serial8250_pnp_exit();
-unreg_uart_drv:
-#ifdef CONFIG_SPARC
-	sunserial_unregister_minors(&serial8250_reg, UART_NR);
-#else
-	uart_unregister_driver(&serial8250_reg);
-#endif
-out:
-	return ret;
-}
-
-static void __exit serial8250_exit(void)
-{
-	struct platform_device *isa_dev =3D serial8250_isa_devs;
-
-	/*
-	 * This tells serial8250_unregister_port() not to re-register
-	 * the ports (thereby making serial8250_isa_driver permanently
-	 * in use.)
-	 */
-	serial8250_isa_devs =3D NULL;
-
-	platform_driver_unregister(&serial8250_isa_driver);
-	platform_device_unregister(isa_dev);
-
-	serial8250_pnp_exit();
-
-#ifdef CONFIG_SPARC
-	sunserial_unregister_minors(&serial8250_reg, UART_NR);
-#else
-	uart_unregister_driver(&serial8250_reg);
-#endif
-}
-
-module_init(serial8250_init);
-module_exit(serial8250_exit);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Generic 8250/16x50 serial driver");
-
-module_param_hw(share_irqs, uint, other, 0644);
-MODULE_PARM_DESC(share_irqs, "Share IRQs with other non-8250/16x50 devices=
 (unsafe)");
-
-module_param(nr_uarts, uint, 0644);
-MODULE_PARM_DESC(nr_uarts, "Maximum number of UARTs supported. (1-" __MODU=
LE_STRING(CONFIG_SERIAL_8250_NR_UARTS) ")");
-
-module_param(skip_txen_test, uint, 0644);
-MODULE_PARM_DESC(skip_txen_test, "Skip checking for the TXEN bug at init t=
ime");
-
-#ifdef CONFIG_SERIAL_8250_RSA
-module_param_hw_array(probe_rsa, ulong, ioport, &probe_rsa_count, 0444);
-MODULE_PARM_DESC(probe_rsa, "Probe I/O ports for RSA");
-#endif
-MODULE_ALIAS_CHARDEV_MAJOR(TTY_MAJOR);
-
-#ifdef CONFIG_SERIAL_8250_DEPRECATED_OPTIONS
-#ifndef MODULE
-/* This module was renamed to 8250_core in 3.7.  Keep the old "8250" name
- * working as well for the module options so we don't break people.  We
- * need to keep the names identical and the convenient macros will happily
- * refuse to let us do that by failing the build with redefinition errors
- * of global variables.  So we stick them inside a dummy function to avoid
- * those conflicts.  The options still get parsed, and the redefined
- * MODULE_PARAM_PREFIX lets us keep the "8250." syntax alive.
- *
- * This is hacky.  I'm sorry.
- */
-static void __used s8250_options(void)
-{
-#undef MODULE_PARAM_PREFIX
-#define MODULE_PARAM_PREFIX "8250_core."
-
-	module_param_cb(share_irqs, &param_ops_uint, &share_irqs, 0644);
-	module_param_cb(nr_uarts, &param_ops_uint, &nr_uarts, 0644);
-	module_param_cb(skip_txen_test, &param_ops_uint, &skip_txen_test, 0644);
-#ifdef CONFIG_SERIAL_8250_RSA
-	__module_param_call(MODULE_PARAM_PREFIX, probe_rsa,
-		&param_array_ops, .arr =3D &__param_arr_probe_rsa,
-		0444, -1, 0);
-#endif
-}
-#else
-MODULE_ALIAS("8250_core");
-#endif
-#endif
diff --git a/drivers/tty/serial/8250/8250_platform.c b/drivers/tty/serial/8=
250/8250_platform.c
index ded985182e04a..4664dbbf26def 100644
--- a/drivers/tty/serial/8250/8250_platform.c
+++ b/drivers/tty/serial/8250/8250_platform.c
@@ -17,7 +17,6 @@
 #include <linux/sunserialcore.h>
 #endif
=20
-#include "../serial_base.h"	/* For serial_base_add_isa_preferred_console()=
 */
 #include "8250.h"
=20
 /*
@@ -97,8 +96,6 @@ void __init serial8250_isa_init_ports(void)
 		port->irqflags |=3D irqflag;
 		if (serial8250_isa_config !=3D NULL)
 			serial8250_isa_config(i, &up->port, &up->capabilities);
-
-		serial_base_add_isa_preferred_console(serial8250_reg.dev_name, i);
 	}
 }
=20

--DC1J995vhGFiO/gP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5sMAACgkQJNaLcl1U
h9Ajugf5AQOGHw5WqhGFjoWp4tnBFTq8Bx0ZGHjGjIs8BSdJiV6G1BH6DjzEK+SN
b9NNjGW+Zi94CL6Q4Ai8kttAaAHa3fMDGCWpQK5y2K/QkCxQbzYTxa0Fms+pOjnu
wezp4lWNUlOz7S+CchgKVcL6xSH+jfhmkuTIt1Frjjkwe+zfgOZ0mRYX+YajezeH
6rQH4l4EHwc9knS7u4SUNTUzG/lmQExEuP/01Pcmupworgbutx8rGl8IQ33Jf7Hr
2XKQ8YzPbZ4L3ITSOSI8Afq3oyJMiEN1nA/07B2yhDse/FeSeaqXgFx1zjCIcHsB
gvPpqx9kPc0YWBMBu+NpkEEhlqqeiw==
=AMS7
-----END PGP SIGNATURE-----

--DC1J995vhGFiO/gP--

