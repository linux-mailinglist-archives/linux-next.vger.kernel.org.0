Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 784DF13CE2F
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 21:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbgAOUq5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 15:46:57 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:50689 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729291AbgAOUq5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 15:46:57 -0500
X-Originating-IP: 79.86.19.127
Received: from debian.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
        (Authenticated sender: alex@ghiti.fr)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BA33EE0002;
        Wed, 15 Jan 2020 20:46:52 +0000 (UTC)
From:   Alexandre Ghiti <alex@ghiti.fr>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexei Starovoitov <ast@kernel.org>,
        linux-next@vger.kernel.org, Zong Li <zong.li@sifive.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Cc:     Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] powerpc: Do not consider weak unresolved symbol relocations as bad
Date:   Wed, 15 Jan 2020 15:46:48 -0500
Message-Id: <20200115204648.7179-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Commit 8580ac9404f6 ("bpf: Process in-kernel BTF") introduced two weak
symbols that may be unresolved at link time which result in an absolute
relocation to 0. relocs_check.sh emits the following warning:

"WARNING: 2 bad relocations
c000000001a41478 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
c000000001a41480 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end"

whereas those relocations are legitimate even for a relocatable kernel
compiled with -pie option.

relocs_check.sh already excluded some weak unresolved symbols explicitly:
remove those hardcoded symbols and add some logic that parses the symbols
using nm, retrieves all the weak unresolved symbols and excludes those from
the list of the potential bad relocations.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/powerpc/Makefile.postlink     |  4 ++--
 arch/powerpc/tools/relocs_check.sh | 27 +++++++++++++++++++--------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/Makefile.postlink b/arch/powerpc/Makefile.postlink
index 134f12f89b92..2268396ff4bb 100644
--- a/arch/powerpc/Makefile.postlink
+++ b/arch/powerpc/Makefile.postlink
@@ -17,11 +17,11 @@ quiet_cmd_head_check = CHKHEAD $@
 quiet_cmd_relocs_check = CHKREL  $@
 ifdef CONFIG_PPC_BOOK3S_64
       cmd_relocs_check =						\
-	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$@" ; \
+	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@" ; \
 	$(BASH) $(srctree)/arch/powerpc/tools/unrel_branch_check.sh "$(OBJDUMP)" "$@"
 else
       cmd_relocs_check =						\
-	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$@"
+	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
 endif
 
 # `@true` prevents complaint when there is nothing to be done
diff --git a/arch/powerpc/tools/relocs_check.sh b/arch/powerpc/tools/relocs_check.sh
index 7b9fe0a567cf..783281b75d9d 100755
--- a/arch/powerpc/tools/relocs_check.sh
+++ b/arch/powerpc/tools/relocs_check.sh
@@ -10,14 +10,15 @@
 # based on relocs_check.pl
 # Copyright © 2009 IBM Corporation
 
-if [ $# -lt 2 ]; then
-	echo "$0 [path to objdump] [path to vmlinux]" 1>&2
+if [ $# -lt 3 ]; then
+	echo "$0 [path to objdump] [path to nm] [path to vmlinux]" 1>&2
 	exit 1
 fi
 
 # Have Kbuild supply the path to objdump so we handle cross compilation.
 objdump="$1"
-vmlinux="$2"
+nm="$2"
+vmlinux="$3"
 
 bad_relocs=$(
 $objdump -R "$vmlinux" |
@@ -26,8 +27,6 @@ $objdump -R "$vmlinux" |
 	# These relocations are okay
 	# On PPC64:
 	#	R_PPC64_RELATIVE, R_PPC64_NONE
-	#	R_PPC64_ADDR64 mach_<name>
-	#	R_PPC64_ADDR64 __crc_<name>
 	# On PPC:
 	#	R_PPC_RELATIVE, R_PPC_ADDR16_HI,
 	#	R_PPC_ADDR16_HA,R_PPC_ADDR16_LO,
@@ -38,15 +37,27 @@ R_PPC_ADDR16_LO
 R_PPC_ADDR16_HI
 R_PPC_ADDR16_HA
 R_PPC_RELATIVE
-R_PPC_NONE' |
-	grep -E -v '\<R_PPC64_ADDR64[[:space:]]+mach_' |
-	grep -E -v '\<R_PPC64_ADDR64[[:space:]]+__crc_'
+R_PPC_NONE'
 )
 
 if [ -z "$bad_relocs" ]; then
 	exit 0
 fi
 
+# Remove from the bad relocations those that match an undefined weak symbol
+# which will result in an absolute relocation to 0.
+# Weak unresolved symbols are of that form in nm output:
+# "                  w _binary__btf_vmlinux_bin_end"
+undef_weak_symbols=$($nm "$vmlinux" | awk -e '$1 ~ /w/ { print $2 }')
+
+while IFS= read -r weak_symbol; do
+	bad_relocs="$(echo -n "$bad_relocs" | sed "/$weak_symbol/d")"
+done <<< "$undef_weak_symbols"
+
+if [ -z "$bad_relocs" ]; then
+	exit 0
+fi
+
 num_bad=$(echo "$bad_relocs" | wc -l)
 echo "WARNING: $num_bad bad relocations"
 echo "$bad_relocs"
-- 
2.20.1

