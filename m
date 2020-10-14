Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85A228E664
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 20:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729931AbgJNS2n convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 14 Oct 2020 14:28:43 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:46935 "EHLO
        us-smtp-delivery-44.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389798AbgJNS2h (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 14:28:37 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-7iWQC8tkOS2JSIKZ2PKgWQ-1; Wed, 14 Oct 2020 14:28:23 -0400
X-MC-Unique: 7iWQC8tkOS2JSIKZ2PKgWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A8951007464;
        Wed, 14 Oct 2020 18:28:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-66-216.rdu2.redhat.com [10.10.66.216])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F10E60BF3;
        Wed, 14 Oct 2020 18:28:19 +0000 (UTC)
From:   Qian Cai <cai@lca.pw>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Oliver O'Halloran <oohall@gmail.com>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH -next] Revert "powerpc/pci: unmap legacy INTx interrupts when a PHB is removed"
Date:   Wed, 14 Oct 2020 14:28:11 -0400
Message-Id: <20201014182811.12027-1-cai@lca.pw>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cai@lca.pw
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lca.pw
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset=WINDOWS-1252
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This reverts commit 3a3181e16fbde752007759f8759d25e0ff1fc425 which
causes memory corruptions on POWER9 NV.

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/include/asm/pci-bridge.h |   6 --
 arch/powerpc/kernel/pci-common.c      | 114 --------------------------
 2 files changed, 120 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index d21e070352dc..d2a2a14e56f9 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -48,9 +48,6 @@ struct pci_controller_ops {
 
 /*
  * Structure of a PCI controller (host bridge)
- *
- * @irq_count: number of interrupt mappings
- * @irq_map: interrupt mappings
  */
 struct pci_controller {
 	struct pci_bus *bus;
@@ -130,9 +127,6 @@ struct pci_controller {
 
 	void *private_data;
 	struct npu *npu;
-
-	unsigned int irq_count;
-	unsigned int *irq_map;
 };
 
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index deb831f0ae13..be108616a721 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -353,115 +353,6 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
 	return NULL;
 }
 
-/*
- * Assumption is made on the interrupt parent. All interrupt-map
- * entries are considered to have the same parent.
- */
-static int pcibios_irq_map_count(struct pci_controller *phb)
-{
-	const __be32 *imap;
-	int imaplen;
-	struct device_node *parent;
-	u32 intsize, addrsize, parintsize, paraddrsize;
-
-	if (of_property_read_u32(phb->dn, "#interrupt-cells", &intsize))
-		return 0;
-	if (of_property_read_u32(phb->dn, "#address-cells", &addrsize))
-		return 0;
-
-	imap = of_get_property(phb->dn, "interrupt-map", &imaplen);
-	if (!imap) {
-		pr_debug("%pOF : no interrupt-map\n", phb->dn);
-		return 0;
-	}
-	imaplen /= sizeof(u32);
-	pr_debug("%pOF : imaplen=%d\n", phb->dn, imaplen);
-
-	if (imaplen < (addrsize + intsize + 1))
-		return 0;
-
-	imap += intsize + addrsize;
-	parent = of_find_node_by_phandle(be32_to_cpup(imap));
-	if (!parent) {
-		pr_debug("%pOF : no imap parent found !\n", phb->dn);
-		return 0;
-	}
-
-	if (of_property_read_u32(parent, "#interrupt-cells", &parintsize)) {
-		pr_debug("%pOF : parent lacks #interrupt-cells!\n", phb->dn);
-		return 0;
-	}
-
-	if (of_property_read_u32(parent, "#address-cells", &paraddrsize))
-		paraddrsize = 0;
-
-	return imaplen / (addrsize + intsize + 1 + paraddrsize + parintsize);
-}
-
-static void pcibios_irq_map_init(struct pci_controller *phb)
-{
-	phb->irq_count = pcibios_irq_map_count(phb);
-	if (phb->irq_count < PCI_NUM_INTX)
-		phb->irq_count = PCI_NUM_INTX;
-
-	pr_debug("%pOF : interrupt map #%d\n", phb->dn, phb->irq_count);
-
-	phb->irq_map = kcalloc(phb->irq_count, sizeof(unsigned int),
-			       GFP_KERNEL);
-}
-
-static void pci_irq_map_register(struct pci_dev *pdev, unsigned int virq)
-{
-	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
-	int i;
-
-	if (!phb->irq_map)
-		return;
-
-	for (i = 0; i < phb->irq_count; i++) {
-		/*
-		 * Look for an empty or an equivalent slot, as INTx
-		 * interrupts can be shared between adapters.
-		 */
-		if (phb->irq_map[i] == virq || !phb->irq_map[i]) {
-			phb->irq_map[i] = virq;
-			break;
-		}
-	}
-
-	if (i == phb->irq_count)
-		pr_err("PCI:%s all platform interrupts mapped\n",
-		       pci_name(pdev));
-}
-
-/*
- * Clearing the mapped interrupts will also clear the underlying
- * mappings of the ESB pages of the interrupts when under XIVE. It is
- * a requirement of PowerVM to clear all memory mappings before
- * removing a PHB.
- */
-static void pci_irq_map_dispose(struct pci_bus *bus)
-{
-	struct pci_controller *phb = pci_bus_to_host(bus);
-	int i;
-
-	if (!phb->irq_map)
-		return;
-
-	pr_debug("PCI: Clearing interrupt mappings for PHB %04x:%02x...\n",
-		 pci_domain_nr(bus), bus->number);
-	for (i = 0; i < phb->irq_count; i++)
-		irq_dispose_mapping(phb->irq_map[i]);
-
-	kfree(phb->irq_map);
-}
-
-void pcibios_remove_bus(struct pci_bus *bus)
-{
-	pci_irq_map_dispose(bus);
-}
-EXPORT_SYMBOL_GPL(pcibios_remove_bus);
-
 /*
  * Reads the interrupt pin to determine if interrupt is use by card.
  * If the interrupt is used, then gets the interrupt line from the
@@ -510,8 +401,6 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
 
 	pci_dev->irq = virq;
 
-	/* Record all interrut mappings for later removal of a PHB */
-	pci_irq_map_register(pci_dev, virq);
 	return 0;
 }
 
@@ -1665,9 +1554,6 @@ void pcibios_scan_phb(struct pci_controller *hose)
 
 	pr_debug("PCI: Scanning PHB %pOF\n", node);
 
-	/* Allocate interrupt mappings array */
-	pcibios_irq_map_init(hose);
-
 	/* Get some IO space for the new PHB */
 	pcibios_setup_phb_io_space(hose);
 
-- 
2.28.0

