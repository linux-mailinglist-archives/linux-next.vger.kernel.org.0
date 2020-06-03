Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3053D1ED0DE
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 15:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgFCNdC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 09:33:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:48008 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgFCNdC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 09:33:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 636FDAE92;
        Wed,  3 Jun 2020 13:33:03 +0000 (UTC)
Date:   Wed, 3 Jun 2020 15:32:57 +0200
From:   Joerg Roedel <jroedel@suse.de>
To:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-next <linux-next@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        mpe <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        sachinp <sachinp@linux.vnet.ibm.com>,
        manvanth <manvanth@linux.vnet.ibm.com>,
        "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
        akpm@linux-foundation.org, Steven Rostedt <rostedt@goodmis.org>,
        hch <hch@lst.de>
Subject: Re: [mainline][Oops][bisected 2ba3e6 ] 5.7.0 boot fails with kernel
 panic on powerpc
Message-ID: <20200603133257.GL6857@suse.de>
References: <1591181457.9020.13.camel@abdul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591181457.9020.13.camel@abdul>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 03, 2020 at 04:20:57PM +0530, Abdul Haleem wrote:
> @Joerg, Could you please have a look?

Can you please try the attached patch?

diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
index 58046ddc08d0..afbab31fbd7e 100644
--- a/include/asm-generic/5level-fixup.h
+++ b/include/asm-generic/5level-fixup.h
@@ -17,6 +17,11 @@
 	((unlikely(pgd_none(*(p4d))) && __pud_alloc(mm, p4d, address)) ? \
 		NULL : pud_offset(p4d, address))
 
+#define pud_alloc_track(mm, p4d, address, mask)					\
+	((unlikely(pgd_none(*(p4d))) &&						\
+	  (__pud_alloc(mm, p4d, address) || ({*(mask)|=PGTBL_P4D_MODIFIED;0;})))?	\
+	  NULL : pud_offset(p4d, address))
+
 #define p4d_alloc(mm, pgd, address)		(pgd)
 #define p4d_alloc_track(mm, pgd, address, mask)	(pgd)
 #define p4d_offset(pgd, start)			(pgd)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7e07f4f490cb..d46bf03b804f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2088,35 +2088,35 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
 		NULL : pud_offset(p4d, address);
 }
 
-static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
+static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
 				     unsigned long address,
 				     pgtbl_mod_mask *mod_mask)
-
 {
-	if (unlikely(pgd_none(*pgd))) {
-		if (__p4d_alloc(mm, pgd, address))
+	if (unlikely(p4d_none(*p4d))) {
+		if (__pud_alloc(mm, p4d, address))
 			return NULL;
-		*mod_mask |= PGTBL_PGD_MODIFIED;
+		*mod_mask |= PGTBL_P4D_MODIFIED;
 	}
 
-	return p4d_offset(pgd, address);
+	return pud_offset(p4d, address);
 }
 
-#endif /* !__ARCH_HAS_5LEVEL_HACK */
-
-static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
+static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
 				     unsigned long address,
 				     pgtbl_mod_mask *mod_mask)
+
 {
-	if (unlikely(p4d_none(*p4d))) {
-		if (__pud_alloc(mm, p4d, address))
+	if (unlikely(pgd_none(*pgd))) {
+		if (__p4d_alloc(mm, pgd, address))
 			return NULL;
-		*mod_mask |= PGTBL_P4D_MODIFIED;
+		*mod_mask |= PGTBL_PGD_MODIFIED;
 	}
 
-	return pud_offset(p4d, address);
+	return p4d_offset(pgd, address);
 }
 
+#endif /* !__ARCH_HAS_5LEVEL_HACK */
+
 static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
 {
 	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
